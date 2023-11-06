require "oauth2"
require "json"
require 'colorize'

puts "Enter your login:"
LOGIN = gets.chomp
UID = "u-s4t2ud-525cf8bc1232d9edf863402ea3b9becefd5945e8a3bd0e0165c72d1ee1e3d067" 
SECRET = "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"
if (LOGIN.empty? || (UID.empty? || SECRET.empty?))
    puts "Error"
else
    client = OAuth2::Client.new(UID, 
    SECRET,
    site: "https://api.intra.42.fr")

    token = client.client_credentials.get_token
    response = token.get("v2/users/#{LOGIN}/cursus_users")
    user_info = JSON.parse(response.body, object_class: OpenStruct)

    black = user_info[0].blackholed_at.red
    level = user_info[0].level

    if (black.empty? && level.empty?)
        puts "No User found"
    else
        puts "*-------------------------------*"
        puts "Hello : #{LOGIN}"
        puts "Your level : #{level}".green
        puts "Your blackhole is in #{black}"
        puts "*-------------------------------*"
    end
end

