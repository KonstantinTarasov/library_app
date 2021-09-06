class BooksController < ApplicationController
  before_action :set_book

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book, notice: 'The books was added successfully.'
    else
      render :new
    end
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'The books was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to book_url, notice: 'The books was successfully deleted'
  end

  private

  def set_book
    @book = Book.find_by(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :description, :year, :author)
  end
end