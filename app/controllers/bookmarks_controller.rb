class BookmarksController < ApplicationController

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list_id = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_param)
    @bookmark.list = @list_id
    if @bookmark.save
      redirect_to list_path(@list_id)
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def bookmark_param
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
