require "rails_helper"

RSpec.describe "エントリー表示機能" do
  context "ログインしていない場合" do
    it "アクセスできない" do
      visit entries_path

      expect(page).to have_current_path new_user_session_path
      expect(page).to have_content "ログインもしくはアカウント登録してください。"
    end
  end

  context "ログインしている場合" do
    let(:user) { create(:user) }
    let(:feed) { create(:feed, user:) }

    before do
      create(:entry, feed:, title: "最初に作成されたエントリー")
      create(:entry, feed:, title: "2番目に作成されたエントリー")
      create(:entry, feed:, title: "3番目に作成されたエントリー")
      sign_in user
    end

    it "作成日順で表示される" do
      visit entries_path

      page_entry_titles = all(".entry-title").map(&:text)
      sorted_entry_titles = %w[3番目に作成されたエントリー 2番目に作成されたエントリー 最初に作成されたエントリー]
      expect(page_entry_titles).to eq(sorted_entry_titles)
    end
  end
end
