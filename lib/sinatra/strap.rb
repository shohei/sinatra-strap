require "sinatra/strap/version"

module Sinatra
  module Strap
    class Base

      attr_accessor :appname

      def generate
        unless directory_exists?(@appname)
          system("mkdir #{@appname}")
          system("cp -r #{File.dirname(__FILE__)}/../../vendor/public #{@appname}")
          system("cp -r #{File.dirname(__FILE__)}/../../vendor/views #{@appname}")
          system("cp #{File.dirname(__FILE__)}/../../vendor/app.rb #{@appname}")
        else
          puts "app folder already exists."
        end
      end

      def show_help 
        puts "Usage:"
        puts "    sinatra-strap new APP_PATH"
        exit(0)
      end

      def directory_exists?(directory)
        File.directory?(directory)
      end

      def replace
        open("#{File.dirname(__FILE__)}/../../vendor/views/index.haml","r+") {|f|
          puts "#{File.dirname(__FILE__)}/../../vendor/views/index.haml"
          f.flock(File::LOCK_EX)
          body = f.read
          body = body.gsub(/%title.*/) do |tmp|
            "#{@appname}"
          end 
          body = body.gsub(/%h1.*/) do |tmp|
            "#{@appname}"
          end 
          f.rewind
          f.puts body
          f.truncate(f.tell)
        }
      end

    end
  end
end

