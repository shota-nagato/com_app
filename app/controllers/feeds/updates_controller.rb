class Feeds::UpdatesController < ApplicationController
  before_action :authenticate_user!

  def update
    feed = current_user.feeds.find(params[:feed_id])
    FetchEntriesJob.perform_async(feed.id)
    redirect_to feeds_path, notice: "フィードを更新しました"
  end
end
