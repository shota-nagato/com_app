module EntryHelper
  def entry_image_url(entry)
    entry.image_url.nil? ? "qiita.png" : entry.image_url
  end
end
