require "test_helper"

class BookMailerTest < ActionMailer::TestCase
  test "comment" do
    mail = BookMailer.comment
    assert_equal "Comment", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
