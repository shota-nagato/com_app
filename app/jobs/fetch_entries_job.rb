class FetchEntriesJob
  include Sidekiq::Worker
  sidekiq_options queue: :default

  def perform(feed_id)
    feed = Feed.find(feed_id)
    rss = fetch_rss(feed)

    rss.entries.each do |rss_entry|
      entry = feed.entries.find_or_create_by(title: rss_entry.title, url: rss_entry.url, published_at: rss_entry.published)
      if rss_entry.image.present?
        entry.update!(image_url: rss_entry.image)
      end
    end

    feed.update!(updated_at: Time.current)
  end

  private

  def fetch_rss(feed)
    response = Faraday.get(feed.url)
    rss = Feedjira.parse(response.body)
  end
end
