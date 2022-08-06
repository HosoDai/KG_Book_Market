class BooksController < ApplicationController
  def index
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @new_book = Book.new
  end

  def create
    new_book = Book.new(book_params)
    new_book.user_id = current_user.id
    new_book.save
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to books_path unless @user == current_user
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  # ストロングパラメータ

  private

  def book_params
    params.require(:book).permit(:title, :image)
  end
end
