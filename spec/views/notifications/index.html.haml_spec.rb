require 'rails_helper'

RSpec.describe "notifications/index", type: :view do
  before(:each) do
    assign(:notifications, [
      Notification.create!(
        :user_id => 1,
        :message => "MyText"
      ),
      Notification.create!(
        :user_id => 1,
        :message => "MyText"
      )
    ])
  end

  it "renders a list of notifications" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
