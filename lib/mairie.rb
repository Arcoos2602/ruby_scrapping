require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_townhall_email(town)
  name_town = town['href'].delete_prefix '.' # urls without balise + delete "."
  pages = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com#{name_town}")) # mettre val url de get_townhall_urlss
  pages.css('/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]').text # recuperation email
end

def get_townhall
  pages = Nokogiri::HTML(URI.open('http://annuaire-des-mairies.com/val-d-oise.html'))
  tab = pages.css('[@class="lientxt"]') # tout les URLS avec balises
  tab.map { |town| { town.text => get_townhall_email(town) } }
end
