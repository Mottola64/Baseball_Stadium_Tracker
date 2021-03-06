require 'pry'

class UsersController < ApplicationController

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    if User.find_by(:username => params[:username])
      @error = "This username is taken, please try again."
      erb :'users/signup'
    elsif params.values.any? {|value| value == ""}
      @error = "All Fields Required"
      erb :'users/signup'
    else
      @user = User.new(params)
      @user.save
      session[:user_id] = @user.id
      redirect '/'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect to '/stadiums'
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/'
    else
      redirect to '/signup'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
  end

end
end
