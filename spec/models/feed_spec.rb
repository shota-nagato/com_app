require 'rails_helper'

RSpec.describe Feed, type: :model do
  let(:feed) { create(:feed) }

  before do
    create(:entry, feed:)
  end

  it "フィードを削除後、紐づくエントリーも削除される" do
    expect do
      feed.destroy!
    end.to change(Entry, :count).by(-1)
  end
end
