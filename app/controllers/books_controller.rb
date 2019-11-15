class BooksController < ApplicationController
  def top
  end

  def index
  	@books = Book.all
  	@book = Book.new
  end

  def create
    @books = Book.all
  	@book = Book.new(book_params)
    flash[:notice] = "Book was successfully created."
  	if @book.save
      redirect_to book_path(@book)
    else
      render "books/index"
    end
  end

  def show
  	@book = Book.find(params[:id])
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
    flash[:notice] = "Book was successfully updated."
  	if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render "books/edit"
    end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
    flash[:notice] = "Book was successfully destroyed."
  	redirect_to books_path
  end

  private

  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
