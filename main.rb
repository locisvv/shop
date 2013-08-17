# encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'data_mapper' 
require 'rack-flash'
require 'mini_magick'

enable :sessions
use Rack::Flash 

Dir["./app/helpers/*.rb"].each { |file| require file }

DataMapper.setup(:default, 'sqlite:db.sqlite')
Dir["./app/models/*.rb"].each { |file| require file }
DataMapper.auto_migrate!

Dir["./app/controllers/*.rb"].each { |file| require file }