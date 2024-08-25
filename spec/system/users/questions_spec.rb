require "rails_helper"

RSpec.describe "質問投稿機能" do
  context "ログインしていない場合" do
    it "アクセスできない" do
      visit questions_path

      expect(page).to have_current_path new_user_session_path
      expect(page).to have_content "ログインもしくはアカウント登録してください。"
    end
  end

  context "ログインしている場合" do
    let(:user) { create(:user) }

    before do
      sign_in user
    end

    describe "新規登録" do
      it "質問を投稿できる" do
        visit new_question_path

        fill_in "question_title", with: "タイトル"
        fill_in "question_content", with: "内容"
        expect do
          click_button "投稿"
          expect(page).to have_content "質問を投稿しました"
        end.to change(Question, :count).by(1)
      end
    end

    describe "編集・解決" do
      let(:question) { create(:question, user:) }
      let(:other_user) { create(:user) }

      context "投稿したユーザーの場合" do
        it "詳細ページに編集ボタン・解決ボタンが表示される" do
          visit question_path(question)
          expect(page).to have_content "編集"
          expect(page).to have_content "解決済みにする"
        end

        it "編集ページにアクセスできる" do
          visit edit_question_path(question)
          expect(page).to have_current_path edit_question_path(question)
        end

        it "解決済みにできる" do
          visit question_path(question)

          accept_confirm("解決済みにしますか？") do
            click_button "解決済みにする"
            expect(page).to have_content "質問を解決済みにしました"
            expect(question.reload.solved_at).not_to be(nil)
          end
        end
      end

      context "投稿したユーザーでない場合" do
        before do
          sign_in other_user
        end

        it "詳細ページに編集ボタン・解決が表示されない" do
          visit question_path(question)
          expect(page).not_to have_content "編集"
          expect(page).not_to have_content "解決済みにする"
        end

        it "編集ページにアクセスできない" do
          expect {
            visit edit_question_path(question)
            expect(page).not_to have_current_path edit_question_path(question)
          }.to raise_error(Pundit::NotAuthorizedError)
        end
      end
    end
  end
end
