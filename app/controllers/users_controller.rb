class UsersController < ApplicationController

  get '/signup' do
    erb :'users/signup'
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect to '/stadiums'
    end
  end

  post '/login' do
    user = User.find_by(:email => params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
    else
      redirect to '/signup'
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect to '/login'
    else
      redirect to '/'
  end



  # post '/signup' do
  #   @user
  # end
end
end
