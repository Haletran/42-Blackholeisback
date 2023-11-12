require "oauth2"
require "json"
require 'colorize'

UID = "" 
SECRET = ""

def main
    if (ARGV.empty? || (UID.empty? || SECRET.empty?))
        puts "Usage: ruby getinfo.rb <your_login>"
        exit
    end
    login = ARGV[0]
    client = OAuth2::Client.new(UID, 
    SECRET,
    site: "https://api.intra.42.fr")

    token = client.client_credentials.get_token
    response = token.get("v2/users/#{login}/cursus_users")
    response2 = token.get("v2/users/#{login}/locations")
    user_info = JSON.parse(response.body, object_class: OpenStruct)
    user_locations = JSON.parse(response2.body, object_class: OpenStruct)
    
    #Get informations
    black = user_info[0].blackholed_at.red
    level = user_info[0].level
    name = user_info[0].grade
    loc = user_locations[0].host


    if (black.empty? && level.empty?)
        puts "No User found"
    else
        puts "+---------------------------------------------+"
        puts "Hello #{login} :)".white.on_light_blue.blink
        puts "Grade : #{name}";
        puts "Available : #{loc}".green
        puts "Your level : #{level}".blue
        puts "Your blackhole is in #{black}"
        puts "+---------------------------------------------+"
    end
end

main if __FILE__ == $PROGRAM_NAME
