require 'rss'
require 'open-uri'
require 'awesome_print'


def write_to_file(feed)
  file = File.open("./temp.txt", "w")
  file.write(feed)
end

url = 'https://github.com/blog.atom'
# url = "http://stackoverflow.com/feeds"
# url = "http://news.ycombinator.com/rss"
open(url) do |rss|
  feed = RSS::Parser.parse(rss)
  # Check feed type with `feed.feed-type`
  if feed.feed_type == "atom"
    file = File.open("feed-content.html", "w")
    feed.entries.each do |item|
      file.write("<h1>#{item.title.content}</h1>")
      file.write(item.content.content.slice(0,1000) << "...")
    end 
  end
end

