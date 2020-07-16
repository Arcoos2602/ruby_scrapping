require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_email(i)
  get_first_name(i).downcase + "." + get_last_name(i).downcase + "@" + "assemblee-nationale.fr"
end

def get_first_name(i)
  name = i.css('td[1]/a').text.delete_prefix("Mme ").delete_prefix("M. ")
  name.split.first
end

def get_last_name(i)
  name = i.css('td[1]/a').text.delete_prefix("Mme ").delete_prefix("M. ")
  name.split.last
end

def depute
  page = Nokogiri::HTML(URI.open('http://www2.assemblee-nationale.fr/deputes/liste/tableau'))
  tab = page.css('//table/tbody/tr')
  tab[0..5].map { |i| { "first name" => get_first_name(i), "last_name" => get_last_name(i), "email" => get_email(i)} }
end

pp depute