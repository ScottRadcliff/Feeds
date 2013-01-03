require 'rss'
require 'open-uri'

url = 'https://github.com/blog.atom'
open(url) do |rss|
  feed = RSS::Parser.parse(rss)
  puts "Title: #{feed.channel.title}"
  feed.items.each do |item|
    puts "Item: #{item.title}"
  end
end