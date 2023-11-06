require "oauth2"
require "json"
require "rack"
require 'colorize'

puts "Enter your login:"
LOGIN = gets.chomp
UID = "" 
SECRET = ""

client = OAuth2::Client.new(UID, 
                            SECRET,
                            site: "https://api.intra.42.fr")
token = client.client_credentials.get_token
response = token.get("v2/users/#{LOGIN}/cursus_users")
user_info = JSON.parse(response.body, object_class: OpenStruct)

black = user_info[0].blackholed_at.red
level = user_info[0].level

puts "*-------------------------------*"
puts "Hello : #{LOGIN}"
puts "Your level : #{level}".green
puts "Your blackhole is in #{black}"
puts "*-------------------------------*"

