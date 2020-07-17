require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_email(i)
  lien = i.css('td[1]/a/@href').text
  page = Nokogiri::HTML(URI.open("http://www2.assemblee-nationale.fr#{lien}"))
  tmp = page.css('div.contenu-principal.en-direct-commission.clearfix > div > dl > dd:nth-child(8) > ul > li:nth-child(2) > a')
  email = tmp.text
end

def get_first_name(i)
  name = i.xpath('td[1]/a').text.delete_prefix("Mme ").delete_prefix("M. ")
  name.split.first
end

def get_last_name(i)
  name = i.xpath('td[1]/a').text.delete_prefix("Mme ").delete_prefix("M. ")
  name.split.last
end

def depute
  page = Nokogiri::HTML(URI.open('http://www2.assemblee-nationale.fr/deputes/liste/tableau'))
  tab = page.xpath('//table/tbody/tr')
  tab[0..2].map { |i| { "first_name" => get_first_name(i), "last_name" => get_last_name(i), "email" => get_email(i)} }
  #tab[0..5].map { |i| { "first_name" => get_first_name(i), "last_name" => get_last_name(i), "email" => get_email(i)} } #to be quicker
end

pp depute