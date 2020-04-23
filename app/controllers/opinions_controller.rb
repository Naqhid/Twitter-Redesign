class OpinionsController < ApplicationController
  def create
    @opinion = Opinion.new(author_id: current_user.id, text: params[:opinion][:text])
    if @opinion.save
      redirect_to home_path
    else
      render 'show'
    end
  end

  def show
    @opinion = Opinion.find(params[:id])
  end

  def index
    @opinion = Opinion.new
  end
end
