class FeedsController < ApplicationController
  before_action :authenticate_user!

  def index
    @feeds = current_user.feeds.order(created_at: :desc)
  end

  def new
    @feed = Feed.new
  end

  def create
    response = fetch_feed(feed_params[:url])
    return unless response.is_a?(Faraday::Response)

    feed = Feedjira.parse(response.body)
    title = feed.title
    @feed = current_user.feeds.new(feed_params.merge(title: title))

    if @feed.save
      redirect_to feeds_path, notice: "フィードを登録しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def fetch_feed(url)
    Faraday.get(url)
  rescue Faraday::ConnectionFailed
    flash[:alert] = "フィードの取得に失敗しました。"
    render :new, status: :unprocessable_entity
  end

  def feed_params
    params.require(:feed).permit(:url)
  end
end
