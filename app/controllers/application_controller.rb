class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "bud_selig"
  end

  get '/' do
    @stadiums = Stadium.all
    if logged_in?
      erb :'stadiums/index'
    else
      erb :'/users/login'
    end
  end


helpers do

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def user_id
    @current_user.id
  end
end
end
