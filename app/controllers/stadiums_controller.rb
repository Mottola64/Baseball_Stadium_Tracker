class StadiumsController < ApplicationController

  get '/stadiums' do
    if logged_in?
      @stadiums = Stadium.all
      erb :'/stadiums/index'
    else
      erb :'users/login'
    end
  end

  get '/stadiums/new' do
    if logged_in?
      erb :'stadiums/new'
    else
      erb :'users/login'
    end
  end

  post '/stadiums' do
    if params.values.any? {|value| value == ""}
      erb :'stadiums/new'
    else
      user = User.find(session[:user_id])
      @stadium = Stadium.create(name: params[:name], team: params[:team], city: params[:city])
      redirect to "/stadiums/#{@stadium.id}"
    end
  end

  get 'stadiums/:id' do
    if logged_in?
      @stadium = Stadium.find(params[:id])
      erb :'stadiums/show'
    else
      erb :'users/login'
    end
  end

end
