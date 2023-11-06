require "oauth2"
require "json"
require 'colorize'
require 'tty-font'
require 'tty-box'

UID = "u-s4t2ud-525cf8bc1232d9edf863402ea3b9becefd5945e8a3bd0e0165c72d1ee1e3d067" 
SECRET = "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"

def main
    if (ARGV.empty? || (UID.empty? || SECRET.empty?))
        puts "Usage: ruby getinfo.rb <your_login>"
        exit
    end
    font = TTY::Font.new(:standard)
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
