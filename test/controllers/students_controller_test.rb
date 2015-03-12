require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:students)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post :create, student: { birdate: @student.birdate, email: @student.email, first_name: @student.first_name, first_name_value: @student.first_name_value, last_name: @student.last_name, last_name_value: @student.last_name_value, registration: @student.registration, registration_time: @student.registration_time }
    end

    assert_redirected_to student_path(assigns(:student))
  end

  test "should show student" do
    get :show, id: @student
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student
    assert_response :success
  end

  test "should update student" do
    patch :update, id: @student, student: { birdate: @student.birdate, email: @student.email, first_name: @student.first_name, first_name_value: @student.first_name_value, last_name: @student.last_name, last_name_value: @student.last_name_value, registration: @student.registration, registration_time: @student.registration_time }
    assert_redirected_to student_path(assigns(:student))
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete :destroy, id: @student
    end

    assert_redirected_to students_path
  end
end
