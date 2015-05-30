require 'open-uri'
require 'simple-rss'

seeds = Array.new

def read_seeds(seeds)
  File.open("seeds.txt", "r") do |infile|
    while (line = infile.gets)
      seeds.push(line.strip)
    end
  end
end

read_seeds(seeds)

seeds.each do |feedurl|
  rss = SimpleRSS.parse open(feedurl)
  rss.items.each do |item|
    puts "#{item.title}\t#{item.link}"
  end
end