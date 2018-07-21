class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'figures/new', :layout => :layout
  end

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  post '/figures' do

  end 

end
