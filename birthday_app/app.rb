require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/birthday'

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do 
    return erb(:index)
  end 

  post '/' do
    session[:birthday] = Birthday.new
    session[:birthday].name = params[:name]
    session[:birthday].birthday_date = params[:birthday_date]

    redirect('/message')
  end 

  get '/message' do
    @birthday = session[:birthday]
    if @birthday.birthday_today?
      return erb(:birthday_message)
    else 
      return erb(:birthday_countdown)
    end 
  end
end

