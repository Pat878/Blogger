class TagsController < ApplicationController

  before_filter :require_login, only: [:destroy]

  def require_login
      unless logged_in?
        flash[:error] = "You must be logged in to perform this action"
      end
    end

  def show
    @tag = Tag.find(params[:id])
  end

  def index
    @tags = Tag.all
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    flash.notice = "Tag '#{@tag.name}' Deleted!"

    redirect_to tags_path
  end

end
