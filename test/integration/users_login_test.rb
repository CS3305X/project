require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
#!! This is copied from section 8.1.5 from the book, it tests to see if an incorrect
# login was made and if so sets the error message to be visible. I think. 

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { email: "", password: "" }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
end