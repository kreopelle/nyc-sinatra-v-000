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
    @figure = Figure.new(params["landmark"])
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(params["landmark"])
    end
    if !params["title"]["name"].empty?
      @figure.titles << Title.create(params["title"])
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  post '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params["figure"])
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(params["landmark"])
      @figure.save
    end
    if !params["title"]["name"].empty?
      @figure.titles << Title.create(params["title"])
      @figure.save
    end
    redirect to "/figures/#{@figure.id}"
  end

end
