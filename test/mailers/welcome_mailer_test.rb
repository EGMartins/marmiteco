require 'test_helper'

class WelcomeMailerTest < ActionMailer::TestCase
  test "interested" do
    mail = WelcomeMailer.interested
    assert_equal "Interested", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
