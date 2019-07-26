class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "bud_selig"
  end

  get '/' do
    if logged_in?
      user = User.find_by_id(session[:user_id])
      @stadiums = Stadium.all
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

  # def self.current_user(session)
  #      @user = User.find_by_id(session[:user_id])
  #      if @user.is_a?(User)
  #          @user
  #      end
  #  end

end
end
