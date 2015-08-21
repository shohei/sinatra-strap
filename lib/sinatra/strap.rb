require "sinatra/strap/version"

module Sinatra
  module Strap
    class Base

      attr_accessor :appname

      def initialize
        @vendor_dir = File.expand_path "#{File.dirname(__FILE__)}/../../vendor"
      end

      def generate
        unless directory_exists?(@appname)
          system("mkdir #{@appname}")
          system("cp -r #{@vendor_dir}/public #{@appname}")
          system("cp -r #{@vendor_dir}/views #{@appname}")
          system("cp #{@vendor_dir}/app.rb #{@appname}")
          replace
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
        template_path = File.expand_path "#{Dir.pwd}/#{@appname}/views/index.haml"
        open("#{template_path}","r+") {|f|
          f.flock(File::LOCK_EX)
          body = f.read
          body = body.gsub(/%title.*/) do |tmp|
            "%title #{@appname}"
          end 
          body = body.gsub(/%h1.*/) do |tmp|
            "%h1 #{@appname}"
          end 
          f.rewind
          f.puts body
          f.truncate(f.tell)
        }
      end

    end
  end
end

