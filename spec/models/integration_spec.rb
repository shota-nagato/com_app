require "rails_helper"

RSpec.describe Integration, type: :model do
  let(:user) { create(:user) }

  before do
    create(:integration, name: "ToggleTrack", user:)
  end

  it "同じツール(name)は2以上登録できない" do
    integration = build(:integration, name: "ToggleTrack", user:)
    expect(integration).to be_invalid
  end
end
