class BookMailer < ApplicationMailer
  def comment(book, comment, email)
    @comment = comment
    @book = book

    mail to: email, subject: "Новый комментарий @ #{book.title}"
  end
end
