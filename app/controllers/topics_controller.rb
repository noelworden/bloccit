class TopicsController < ApplicationController

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new
    @topic.name = params[:topic][:name]
    @topic.description = params[:topic][:description]
    @topic.publik = params[:topic][:publik]

    if @topic.save
      redirect_to @topic, notice: "Topic was saved successfully"
    else
      flash.new[:alert] = "Error, error, error!"
      render :new
    end
  end
end