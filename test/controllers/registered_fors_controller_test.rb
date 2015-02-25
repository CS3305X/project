require 'test_helper'

class RegisteredForsControllerTest < ActionController::TestCase
  setup do
    @registered_for = registered_fors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:registered_fors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create registered_for" do
    assert_difference('RegisteredFor.count') do
      post :create, registered_for: { module_code: @registered_for.module_code, user_id: @registered_for.user_id }
    end

    assert_redirected_to registered_for_path(assigns(:registered_for))
  end

  test "should show registered_for" do
    get :show, id: @registered_for
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @registered_for
    assert_response :success
  end

  test "should update registered_for" do
    patch :update, id: @registered_for, registered_for: { module_code: @registered_for.module_code, user_id: @registered_for.user_id }
    assert_redirected_to registered_for_path(assigns(:registered_for))
  end

  test "should destroy registered_for" do
    assert_difference('RegisteredFor.count', -1) do
      delete :destroy, id: @registered_for
    end

    assert_redirected_to registered_fors_path
  end
end
