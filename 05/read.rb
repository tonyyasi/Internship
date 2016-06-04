require 'rest-client'
require 'nokogiri'

html = RestClient.get('http://menumania.seccionamarilla.com.mx/restaurantes/restaurantes/monterrey/nuevo-leon/1')

transcrito = Nokogiri::HTML(html)

restaurantes = []

transcrito.css('#content .col1 .left ul .vcard').each do |text|
puts "hola"
nombre = text.css('a').text
puts nombre

end




