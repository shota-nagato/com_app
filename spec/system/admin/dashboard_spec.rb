require "rails_helper"

RSpec.describe "管理画面ダッシュボード" do
  context "ログインしていない場合" do
    it "アクセスできない" do
      visit admin_root_path

      expect(page).not_to have_content "ダッシュボード"
    end
  end

  context "一般ユーザーでログインしている場合" do
    let(:user) { create(:user) }

    before do
      sign_in user
    end

    it "アクセスできない" do
      visit admin_root_path

      expect(page).not_to have_content "ダッシュボード"
    end
  end

  context "管理者としてログインしている場合" do
    let(:admin) { create(:user, admin: true) }

    before do
      sign_in admin
    end

    it "アクセスできる" do
      visit admin_root_path

      expect(page).to have_content "ダッシュボード"
    end
  end
end
