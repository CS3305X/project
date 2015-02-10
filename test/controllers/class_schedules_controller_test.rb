require 'test_helper'

class ClassSchedulesControllerTest < ActionController::TestCase
  setup do
    @class_schedule = class_schedules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:class_schedules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create class_schedule" do
    assert_difference('ClassSchedule.count') do
      post :create, class_schedule: { cancelled: @class_schedule.cancelled, end_time: @class_schedule.end_time, location: @class_schedule.location, module_code: @class_schedule.module_code, start_time: @class_schedule.start_time, subjects_id: @class_schedule.subjects_id }
    end

    assert_redirected_to class_schedule_path(assigns(:class_schedule))
  end

  test "should show class_schedule" do
    get :show, id: @class_schedule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @class_schedule
    assert_response :success
  end

  test "should update class_schedule" do
    patch :update, id: @class_schedule, class_schedule: { cancelled: @class_schedule.cancelled, end_time: @class_schedule.end_time, location: @class_schedule.location, module_code: @class_schedule.module_code, start_time: @class_schedule.start_time, subjects_id: @class_schedule.subjects_id }
    assert_redirected_to class_schedule_path(assigns(:class_schedule))
  end

  test "should destroy class_schedule" do
    assert_difference('ClassSchedule.count', -1) do
      delete :destroy, id: @class_schedule
    end

    assert_redirected_to class_schedules_path
  end
end
