class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "bud_selig"
  end

  get '/' do
    if logged_in?
      redirect '/stadiums'
    else
      erb :'/users/signup'
  end

end
