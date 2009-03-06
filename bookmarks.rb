#!/usr/bin/env ruby

require 'rubygems'
require 'hpricot'
require 'open-uri'

feed = ARGV[0]
# feed = "data/mgt450.xml"

outfile = ARGV[1]

doc = Hpricot.XML(open(feed))

out = File.new(outfile,"a")

(doc/:item).each do |item|
  b = {}
  b[:title] = (item/:title).inner_html
  b[:date] = ParseDate.parsedate((item/:pubDate).inner_html)
  b[:link] = (item/:link).inner_html
  b[:creator] = /<!\[CDATA\[(.*)\]\]>/.match((item/'dc:creator').inner_html)[1]
  
  b[:tags] = []
  (item/:category).each { |cat| b[:tags] << cat.inner_html }
  
  # puts b.inspect  
  
  line = [Time.local(*b[:date]).strftime("%Y/%m/%d %H:%M:%S"), b[:title], b[:link], b[:creator], b[:tags].join(' ')].join("\t")
  # puts line
  out.puts line
end

out.close

`cp #{outfile} #{outfile}.tmp`
`sort #{outfile}.tmp | uniq > #{outfile}`
`rm #{outfile}.tmp`

