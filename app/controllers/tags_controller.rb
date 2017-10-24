class TagsController < ApplicationController
  before_action :require_login, only: [:destroy]
  
  def show
    @tag = Tag.find(params[:id])
  end
  
  def index
    @tag = Tag.all
  end

  def destroy
    @tag = Tag.find(params[:id]).destroy
    redirect_to tags_path(@tags)
  end
end
