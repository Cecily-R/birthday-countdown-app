# frozen_string_literal: true
require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/birthday'

class Application < Sinatra::Base
  
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    @error = session[:error]
    return erb(:index)
  end

  post '/' do
    session[:error] = nil
    session[:birthday] = Birthday.new
    session[:birthday].name = params[:name]
    session[:birthday].birthday_date = params[:birthday_date]

    error = params[:name].empty? || params[:birthday_date].nil? ? 'Please enter a valid name and birth date' : nil

    if error
      session[:error] = error
      redirect('/')
    else
      redirect('/message');
    end
  end

  get '/message' do
    @birthday = session[:birthday]
    return erb(:birthday_message) if @birthday.birthday_today?

    return erb(:birthday_countdown)
  end
end
