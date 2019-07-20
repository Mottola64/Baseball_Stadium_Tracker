class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    #enable :sessions
    #set :session_secret, "bud_selig"
  end

  get '/' do
    "Hello World?"
  end

end
