class FetchEntriesJob
  include Sidekiq::Worker
  sidekiq_options queue: :default

  def perform
    Feed.all.each do |feed|
      response = Faraday.get(feed.url)
      rss = Feedjira.parse(response.body)
      rss.entries.each do |rss_entry|
        entry = feed.entries.find_or_create_by(title: rss_entry.title, url: rss_entry.url, published_at: rss_entry.published)
        if rss_entry.image.present?
          entry.update!(image_url: rss_entry.image)
        end
      end
    end
  end
end
