class TagsController < ApplicationController
  before_filter :require_login, only: [:destroy, :edit, :update]

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    @tag.update(params.require(:tag).permit(:name))

    flash.notice = "Tag '#{@tag.name}' Updated!"

    redirect_to tag_path(@tag)
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    flash.notice = "Tag '#{@tag.name}' Deleted!"
    redirect_to tags_path    
  end
end
