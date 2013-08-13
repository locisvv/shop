# encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'data_mapper' 

DataMapper.setup(:default, 'sqlite:db.sqlite')

Dir["./app/models/*.rb"].each { |file| require file }
DataMapper.auto_migrate!

Dir["./app/helpers/*.rb"].each { |file| require file }
Dir["./app/controllers/*.rb"].each { |file| require file }