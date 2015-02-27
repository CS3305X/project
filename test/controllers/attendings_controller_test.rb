require 'test_helper'

class AttendingsControllerTest < ActionController::TestCase
  setup do
    @attending = attendings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attendings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attending" do
    assert_difference('Attending.count') do
      post :create, attending: { confirmed: @attending.confirmed, meeting_id: @attending.meeting_id, user_id: @attending.user_id }
    end

    assert_redirected_to attending_path(assigns(:attending))
  end

  test "should show attending" do
    get :show, id: @attending
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attending
    assert_response :success
  end

  test "should update attending" do
    patch :update, id: @attending, attending: { confirmed: @attending.confirmed, meeting_id: @attending.meeting_id, user_id: @attending.user_id }
    assert_redirected_to attending_path(assigns(:attending))
  end

  test "should destroy attending" do
    assert_difference('Attending.count', -1) do
      delete :destroy, id: @attending
    end

    assert_redirected_to attendings_path
  end
end
