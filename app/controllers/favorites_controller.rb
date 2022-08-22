class FavoritesController < ApplicationController
  def create
    # paramsで取ってきたbook_idをローカル変数bookに代入
    @book = Book.find(params[:book_id])
    # favoriteのbook_idを本のidとして生成
    favorite = current_user.favorites.new(book_id: @book.id)
    favorite.save
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: @book.id)
    favorite.destroy
    # redirect_back(fallback_location: root_path)
  end
end
