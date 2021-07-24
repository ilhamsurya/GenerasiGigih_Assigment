ENV["SINATRA_ENV"] ||= "development"
ENV["DB_NAME"] ||= "food_oms_db"
require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'], ENV["DB_NAME"])