class StadiumsController < ApplicationController

  get '/stadiums/new' do
    if logged_in?
      erb :'stadiums/new'
    else
      erb :'users/login'
    end
  end

  get '/stadiums' do
    if logged_in?
      @stadiums = Stadium.all
      erb :'stadiums/index'
    else
      erb :'users/login'
    end
  end

  post '/stadiums' do
    if params.values.any? {|value| value == ""}
      erb :'stadiums/new'
    else
      user = User.find(session[:user_id])
      @stadium = Stadium.create(name: params[:name], team: params[:team])
      redirect to "/stadiums/#{stadium.id}"
    end
  end

  get '/stadiums/:id' do
    if logged_in?
      @stadium = Stadium.find(params[:id])
      erb :'stadiums/show'
    else
      erb :'users/login'
    end
  end

  post '/stadiums/:id' do
   if params.values.any? {|value| value == ""}
     @stadium = Stadium.find(params[:id])
     erb :'stadiums/edit'
     redirect to "/stadiums/#{params[:id]}/edit"
   else
     @stadium = Stadium.find(params[:id])
     @stadium.name = params[:name]
     @stadium.team = params[:team]
     @stadium.save
     redirect to "/stadiums/#{@stadium.id}"
   end
 end

  get '/stadiums/:id/edit' do
    if logged_in?
    @stadium = Stadium.find(params[:id])
     erb :'stadiums/edit'
    else
      erb :'/users/login'
  end
end

  get '/stadiums/:id/delete' do
    if logged_in?
      @stadium = Stadium.find(params[:id])
      @stadium.delete
      redirect to '/stadiums'
    else
      redirect to '/login'
  end
end

end
