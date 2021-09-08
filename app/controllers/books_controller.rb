class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  before_action :set_book
  before_action :set_current_user_book, only: [:edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = current_user.books.build
  end

  def edit
  end

  def create
    @book = current_user.books.build(book_params)

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

  def set_current_user_book
    @book = current_user.books.find(params[:id])
  end

  def set_book
    @book = Book.find_by(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :description, :year, :author)
  end
end
