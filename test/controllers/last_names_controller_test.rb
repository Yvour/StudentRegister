require 'test_helper'

class LastNamesControllerTest < ActionController::TestCase
  setup do
    @last_name = last_names(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:last_names)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create last_name" do
    assert_difference('LastName.count') do
      post :create, last_name: { name: @last_name.name }
    end

    assert_redirected_to last_name_path(assigns(:last_name))
  end

  test "should show last_name" do
    get :show, id: @last_name
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @last_name
    assert_response :success
  end

  test "should update last_name" do
    patch :update, id: @last_name, last_name: { name: @last_name.name }
    assert_redirected_to last_name_path(assigns(:last_name))
  end

  test "should destroy last_name" do
    assert_difference('LastName.count', -1) do
      delete :destroy, id: @last_name
    end

    assert_redirected_to last_names_path
  end
end
