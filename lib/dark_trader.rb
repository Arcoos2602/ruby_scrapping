require 'rubygems'
require 'nokogiri'
require 'open-uri'

def crypto_scrapper
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  tmp = page.xpath('/html/body/div[1]/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr')
  crypto_name_array = (tmp.map { |tr| { tr.xpath('td[2]').text => tr.xpath('td[5]').text } })
end

pp crypto_scrapper