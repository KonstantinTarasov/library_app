class CommentsController < ApplicationController
  before_action :set_book, only: [:create, :destroy]
  before_action :set_comment, only: [:destroy]

  def create
    @new_comment = @book.comments.build(comment_params)

    @new_comment.user = current_user

    if @new_comment.save
      redirect_to @book, notice: 'comment was successful created'
    else
      render :'books/show'
    end
  end

  def destroy
    mesage = {noice: ('comment was successful destroyed')}

    if current_user_can_edit?(@comment)
      @comment.destroy!
    else
      mesage = {alert: ('error when a destroyed comment')}
    end

    redirect_to @book, mesage
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def set_comment
    @comment = @book.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body,:user_name)
  end
end
