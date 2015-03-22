require 'test_helper'

class LastNameSuffixesControllerTest < ActionController::TestCase
  setup do
    @last_name_suffix = last_name_suffixes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:last_name_suffixes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create last_name_suffix" do
    assert_difference('LastNameSuffix.count') do
      post :create, last_name_suffix: { name: @last_name_suffix.name }
    end

    assert_redirected_to last_name_suffix_path(assigns(:last_name_suffix))
  end

  test "should show last_name_suffix" do
    get :show, id: @last_name_suffix
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @last_name_suffix
    assert_response :success
  end

  test "should update last_name_suffix" do
    patch :update, id: @last_name_suffix, last_name_suffix: { name: @last_name_suffix.name }
    assert_redirected_to last_name_suffix_path(assigns(:last_name_suffix))
  end

  test "should destroy last_name_suffix" do
    assert_difference('LastNameSuffix.count', -1) do
      delete :destroy, id: @last_name_suffix
    end

    assert_redirected_to last_name_suffixes_path
  end
end
