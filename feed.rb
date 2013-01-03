require 'rss'
require 'open-uri'
class Feed
  def initialize;end

  def fetch(sources)
    feeds = []
    sources["sources"].each do |source|
      open(source["url"]) do |rss|
        feed = RSS::Parser.parse(rss)
        feeds << feed.items
      end
    end
    return feeds
  end
end