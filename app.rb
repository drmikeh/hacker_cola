require 'sinatra'
require_relative 'model/vending_machine'

enable :sessions

def update_disabled
  @disabled = 'disabled' unless @vending_machine.sufficient_amount?
end

configure do
  set :session_secret, 'My session secret'
end

before do
  if session[:vending_machine].nil?
    session[:vending_machine] = VendingMachine.new(100, 75)
  end
  @vending_machine = session[:vending_machine]
end

get '/' do
  erb :home
end

get '/nickel' do
  @vending_machine.nickel
  update_disabled
  erb :home
end

get '/dime' do
  @vending_machine.dime
  update_disabled
  erb :home
end

get '/quarter' do
  @vending_machine.quarter
  update_disabled
  erb :home
end

get '/purchase' do
  if !@vending_machine.sold_out? && @vending_machine.sufficient_amount?
    @change = @vending_machine.purchase
    @hacker_cola_message = 'Enjoy your Hacker Cola!'
    @change_message = "Your change is #{@change} cents."
    update_disabled
  end
  erb :home
end
