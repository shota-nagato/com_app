require "rails_helper"

RSpec.describe "質問へのコメント投稿機能" do
  let(:user) { create(:user) }
  let(:question) { create(:question, user:) }

  context "ログインしていない場合" do
    it "アクセスできない" do
      visit question_comments_path(question)

      expect(page).to have_current_path new_user_session_path
      expect(page).to have_content "ログインもしくはアカウント登録してください。"
    end
  end

  context "ログインしている場合" do
    before do
      sign_in user
    end

    describe "新規コメント" do
      it "質問に対するコメントを投稿できる" do
        visit question_path(question)

        fill_in "markdown_content", with: "コメントです"
        expect do
          click_button "コメント"
          expect(page).to have_content "コメントです"
        end.to change(Comment, :count).by(1)
      end
    end
  end
end
