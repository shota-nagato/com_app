class FetchEntriesJob
  include Sidekiq::Worker
  sidekiq_options queue: :default

  def perform
    Feed.all.each do |feed|
      response = Faraday.get(feed.url)
      rss = Feedjira.parse(response.body)
      rss.entries.each do |entry|
        e = feed.entries.find_or_create_by(title: entry.title, url: entry.url, published_at: entry.published)
        if entry.image.present?
          e.update!(image_url: entry.image)
        end
      end
    end
  end
end
