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
    @figure = Figure.new(params["figure"])
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(params["landmark"])
    end
    if !params["title"]["name"].empty?
      @figure.titles << Title.create(params["title"])
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

# {"figure"=>{"name"=>"Margaret Mead", "title_ids"=>["on"], "landmark_ids"=>["on"]}, "title"=>{"name"=>"Anthropologist"}, "landmark"=>{"name"=>"Coming of Age in Samoa", "year_completed"=>"1950"}}

end
