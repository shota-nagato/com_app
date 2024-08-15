require "rails_helper"

RSpec.describe "フィード登録機能" do
  context "ログインしていない場合" do
    it "アクセスできない" do
      visit feeds_path

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
      context "正しくないURLの場合" do
        it "登録できない" do
          visit new_feed_path
          fill_in "feed_url", with: "http://invalid.com/feed"

          expect do
            click_button "登録"
            expect(page).to have_content "フィードの取得に失敗しました"
          end.to change(Feed, :count).by(0)
        end
      end

      context "正しいURLの場合" do
        it "登録できる" do
          visit new_feed_path
          fill_in "feed_url", with: "https://toyokeizai.net/list/feed/rss"

          expect do
            click_button "登録"
            expect(page).to have_content "フィードを登録しました"
          end.to change(Feed, :count).by(1)
        end
      end
    end

    describe "削除" do
      before do
        create(:feed, user:)
      end

      it "登録したフィードを削除できる" do
        visit feeds_path

        expect do
          accept_confirm("削除しますか？") do
            click_button "削除"
          end
          expect(page).to have_current_path feeds_path
          expect(page).to have_content "フィードを削除しました"
        end.to change(Feed, :count).by(-1)
      end
    end
  end
end
