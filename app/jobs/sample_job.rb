class SampleJob
  include Sidekiq::Worker
  sidekiq_options queue: :default

  def perform
    Feed.all.each do |feed|
      response = Faraday.get(feed.url)
      rss = Feedjira.parse(response.body)
      rss.entries.each do |entry|
        # 前日に投稿されたエントリーを保存する
        if entry.published.to_date == Date.yesterday
          feed.entries.find_or_create_by(title: entry.title, url: entry.url, published_at: entry.published)
        end
      end
    end
  end
end
