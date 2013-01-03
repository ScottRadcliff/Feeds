require 'minitest/autorun'
require 'awesome_print'
require 'rss'
require 'open-uri'
require 'json'
require_relative '../feed'

# class Feed
#   def initialize
#   end

#   def get_feed(source)
#     open(source["url"]) do |rss|
#       feed = RSS::Parser.parse(rss)
#       if feed.feed_type == "rss"
#         feed.items.each do |item|
#           item
#         end
#       end
#     end
#   end

#   def fetch(json)
#     items = []
#     json["sources"].each do |source|
#       items << get_feed(source)
#     end
#     return items
#   end
# end

class SourceTest < MiniTest::Unit::TestCase
  def test_json_parsed
    @sources = JSON.load(File.open("./test/fixtures/source_fixture.json"))
    assert @sources["sources"][0]["name"] == "Hacker News", "Name not found"
  end

  def test_rss_returned
    @feeds = Feed.new
    result = @feeds.fetch(JSON.load(File.open("./test/fixtures/source_fixture.json"))) 
    ap result
    assert_instance_of(Array, result)
  end
end
