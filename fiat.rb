require 'nokogiri'
require 'open-uri'

fiat = open( "https://coinmarketcap.com/currencies/neblio/")
document = Nokogiri::HTML(fiat)

usd = document.xpath("/html/body/div[4]/div/div[1]/div[3]/div[2]/span[1]/span[1]").inner_html
k = usd.gsub(/\s+\<.*\>/, "")

percent = open( "https://coinmarketcap.com/currencies/neblio/")
documentx = Nokogiri::HTML(percent)

fix = documentx.xpath("/html/body/div[4]/div/div[1]/div[3]/div[2]/span[4]/span").inner_html
b = fix.gsub(/\s+/, "")
n = fix.to_i

x = " Δ #{b}%"

c= "$#{k}"

if n > 0.00
    x = " :arrow_up_small: #{b}%"
elsif n > 10
    x = " :arrow_double_up: #{b}%"
elsif n < 0.00
    x = " :arrow_down_small: #{b}%"
elsif n < -10
    x = " :arrow_double_down: #{b}%"
end

print c ; print x
