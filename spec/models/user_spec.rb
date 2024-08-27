require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  before do
    create(:feed, user:)
    create(:question, user:)
  end

  it "ユーザーを削除後、紐づくfeed, questionも削除される" do
    expect do
      user.destroy!
    end.to change(Feed, :count).by(-1)
      .and change(Question, :count).by(-1)
  end
end
