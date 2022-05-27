class ListsController < ApplicationController
  def index
    @lists = List.all.order(:name)
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = Bookmark.where(list_id: params[:id])
    @new_bookmark = Bookmark.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to :lists
    else
      redirect_to new_list_path
    end
  end

  def new
    @list = List.new
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
