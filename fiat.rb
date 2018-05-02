require 'nokogiri'
require 'open-uri'

fiat = open( "https://coinmarketcap.com/currencies/neblio/")
document = Nokogiri::HTML(fiat)

usd = document.xpath("//*[@id="quote_price"]/span[1]").inner_html
k = usd.gsub(/\s+\<.*\>/, "")

percent = open( "https://coinmarketcap.com/currencies/neblio/")
documentx = Nokogiri::HTML(percent)

fix = documentx.xpath("/html/body/div[6]/div/div[1]/div[4]/div[2]/span[2]").inner_html
b = fix.gsub(/\s+/, "")
x = " #{b}"
print k ; print x






