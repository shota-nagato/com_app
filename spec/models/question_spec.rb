require "rails_helper"

RSpec.describe Question, type: :model do
  let(:user) { create(:user) }
  let(:question) { create(:question, user:) }

  before do
    create(:comment, user:, commentable: question)
  end

  # it "質問を削除後、紐付くコメントも削除される" do
  #   expect do
  #     question.destroy!
  #   end.to change(Comment, :count).by(-1)
  # end
end
