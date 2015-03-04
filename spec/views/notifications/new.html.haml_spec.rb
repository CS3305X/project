require 'rails_helper'

RSpec.describe "notifications/new", type: :view do
  before(:each) do
    assign(:notification, Notification.new(
      :user_id => 1,
      :message => "MyText"
    ))
  end

  it "renders new notification form" do
    render

    assert_select "form[action=?][method=?]", notifications_path, "post" do

      assert_select "input#notification_user_id[name=?]", "notification[user_id]"

      assert_select "textarea#notification_message[name=?]", "notification[message]"
    end
  end
end
