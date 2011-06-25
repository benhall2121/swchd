require 'test_helper'

class AttachedFilesControllerTest < ActionController::TestCase
  setup do
    @attached_file = attached_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attached_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attached_file" do
    assert_difference('AttachedFile.count') do
      post :create, :attached_file => @attached_file.attributes
    end

    assert_redirected_to attached_file_path(assigns(:attached_file))
  end

  test "should show attached_file" do
    get :show, :id => @attached_file.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @attached_file.to_param
    assert_response :success
  end

  test "should update attached_file" do
    put :update, :id => @attached_file.to_param, :attached_file => @attached_file.attributes
    assert_redirected_to attached_file_path(assigns(:attached_file))
  end

  test "should destroy attached_file" do
    assert_difference('AttachedFile.count', -1) do
      delete :destroy, :id => @attached_file.to_param
    end

    assert_redirected_to attached_files_path
  end
end
