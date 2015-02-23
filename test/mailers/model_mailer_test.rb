require 'test_helper'

class ModelMailerTest < ActionMailer::TestCase
  test "new_record_notification" do
    mail = ModelMailer.new_record_notification
    assert_equal "New record notification", mail.subject
    assert_equal ["111378696@umail.ucc.ie"], mail.to
    assert_equal ["UCCEvent@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
