class LandmarksController < ApplicationController

  get '/landmarks/new' do
    erb :'landmarks/new', :layout => :layout
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params["landmark"])
    redirect to "/landmarks/#{@landmark.id}"
  end

  post '/figures/:id' do
    @landmark = Landmark.update(params["landmark"])
    redirect to "/landmarks/#{@landmark.id}"
  end

end
