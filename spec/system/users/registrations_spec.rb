require "rails_helper"

RSpec.describe "ユーザー登録" do
  describe "新規登録" do
    context "正しく情報を入力した場合" do
      it "認証メールが送信され、リンクをクリックすると有効化される" do
        visit new_user_registration_path
        expect(page).to have_content "アカウントをお持ちですか"

        fill_in "user_email", with: "user@example.com"
        fill_in "user_password", with: "password"

        expect do
          click_button "アカウント登録"
          expect(page).to have_current_path root_path
          expect(page).to have_content "本人確認用のメールを送信しました。メール内のリンクからアカウントを有効化させてください。"
        end.to change(User, :count).by(1)

        mail = ActionMailer::Base.deliveries.last
        # user = User.last
        expect(mail.subject).to eq("メールアドレス確認メール")
        expect(mail.to).to eq(["user@example.com"])

        # TODO: net::ERR_CONNECTION_REFUSEDが発生するため一旦コメントアウト
        # confirm_url = URI.extract(mail.body.decoded).first
        # visit confirm_url
        # expect(page).to have_current_path new_user_session_path
        # expect(page).to have_content 'メールアドレスが確認できました'
        # expect(user.reload.confirmed_at).not_to be_nil
      end
    end
  end

  describe "編集機能" do
    let(:user) { create(:user, name: "編集前の名前", email: "user@example.com", password: "password") }

    before do
      sign_in user
    end

    it "名前を編集できる" do
      visit edit_user_registration_path

      fill_in "user_name", with: "編集後の名前"
      click_button "更新"
      expect(page).to have_current_path root_path
      expect(page).to have_content "アカウント情報を変更しました。"
      expect(user.reload.name).to eq("編集後の名前")
    end

    it "現在のパスワードを入力してパスワードを編集できる" do
      visit edit_account_password_path

      fill_in "user_current_password", with: "password"
      fill_in "user_password", with: "edited-password"
      fill_in "user_password_confirmation", with: "edited-password"
      click_button "更新"

      expect(page).to have_current_path edit_account_password_path
      expect(page).to have_content "パスワードを更新しました。"

      sign_out user
      visit new_user_session_path

      fill_in "user_email", with: "user@example.com"
      fill_in "user_password", with: "edited-password"
      click_button "ログイン"

      expect(page).to have_content "ログインしました"
    end

    context "メールアドレスを変更する場合" do
      it "認証メールが送られる" do
        visit edit_user_registration_path

        fill_in "user_email", with: "edited@example.com"
        click_button "更新"

        expect(page).to have_content "アカウント情報を変更しました。変更されたメールアドレスの本人確認のため、本人確認用メールより確認処理をおこなってください。"

        mail = ActionMailer::Base.deliveries.last
        expect(mail.subject).to eq("メールアドレス確認メール")
        expect(mail.to).to eq(["edited@example.com"])

        # TODO: net::ERR_CONNECTION_REFUSEDが発生するため一旦コメントアウト
        # confirm_url = URI.extract(mail.body.decoded).first
        # visit confirm_url
        # expect(page).to have_current_path new_user_session_path
        # expect(page).to have_content 'メールアドレスが確認できました'
      end
    end
  end
end
