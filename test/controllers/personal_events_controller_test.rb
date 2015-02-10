require 'test_helper'

class PersonalEventsControllerTest < ActionController::TestCase
  setup do
    @personal_event = personal_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:personal_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create personal_event" do
    assert_difference('PersonalEvent.count') do
      post :create, personal_event: { description: @personal_event.description, end_time: @personal_event.end_time, event_name: @personal_event.event_name, location: @personal_event.location, start_time: @personal_event.start_time, user_id: @personal_event.user_id }
    end

    assert_redirected_to personal_event_path(assigns(:personal_event))
  end

  test "should show personal_event" do
    get :show, id: @personal_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @personal_event
    assert_response :success
  end

  test "should update personal_event" do
    patch :update, id: @personal_event, personal_event: { description: @personal_event.description, end_time: @personal_event.end_time, event_name: @personal_event.event_name, location: @personal_event.location, start_time: @personal_event.start_time, user_id: @personal_event.user_id }
    assert_redirected_to personal_event_path(assigns(:personal_event))
  end

  test "should destroy personal_event" do
    assert_difference('PersonalEvent.count', -1) do
      delete :destroy, id: @personal_event
    end

    assert_redirected_to personal_events_path
  end
end
