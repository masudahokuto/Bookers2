class BooksController < ApplicationController
  def new
    @books = Book.new
  end

  def create
    @books = Books.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_pas
  end
  def show
  end

  def edit
  end
  
  
  private

  def book_params
    params.require(:book).permit(:title, :opinion)
  end
end

