require "sinatra/strap/version"

module Sinatra
  class Strap

    def generate(appname)
      if  File.directory?(appname)
        system("mkdir #{appname}")
        system("cp -r #{File.dirname(__FILE__)}/../vendor/public #{appname}")
        system("cp -r #{File.dirname(__FILE__)}/../vendor/views #{appname}")
        system("cp #{File.dirname(__FILE__)}/../vendor/app.rb #{appname}")
      else
        puts "app folder already exists."
      end
    end

    def show_help 
      puts "Usage:"
      puts "    sinatra-strap new APP_PATH"
      exit(0)
    end

  end
end
