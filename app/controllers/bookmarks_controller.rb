class BookmarksController < ApplicationController

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to lists_path
    else
      render :new
    end

  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:list_id, :movie_id, :comment)
  end
end
