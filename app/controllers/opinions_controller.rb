class OpinionsController < ApplicationController
  before_action :require_login, only: %i[create show index]

  def create
    @opinion = Opinion.new(opinion_param)
    @opinion.author_id = current_user.id
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

  def require_login
    redirect_to login_path unless current_user
  end

  private

  def opinion_param
    params.require('opinion').permit(:text)
  end
end
