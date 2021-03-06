class CommentsController < ApplicationController
  before_action :set_book, only: [:create, :destroy]
  before_action :set_comment, only: [:destroy]

  def create
    @new_comment = @book.comments.build(comment_params)
    @new_comment.user = current_user

    if check_captcha(@new_comment) && @new_comment.save
      notify_owner(@book,@new_comment)

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

  def notify_owner(book, comment)
    owner_email = [book.user.email].uniq

    owner_email.each do |mail|
      BookMailer.comment(book, comment, mail).deliver_now
    end
  end

  def check_captcha(model)
    current_user.present? || verify_recaptcha(model: model)
  end
end
