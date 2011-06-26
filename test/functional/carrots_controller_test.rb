require 'test_helper'

class CarrotsControllerTest < ActionController::TestCase
  setup do
    @carrot = carrots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:carrots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create carrot" do
    assert_difference('Carrot.count') do
      post :create, :carrot => @carrot.attributes
    end

    assert_redirected_to carrot_path(assigns(:carrot))
  end

  test "should show carrot" do
    get :show, :id => @carrot.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @carrot.to_param
    assert_response :success
  end

  test "should update carrot" do
    put :update, :id => @carrot.to_param, :carrot => @carrot.attributes
    assert_redirected_to carrot_path(assigns(:carrot))
  end

  test "should destroy carrot" do
    assert_difference('Carrot.count', -1) do
      delete :destroy, :id => @carrot.to_param
    end

    assert_redirected_to carrots_path
  end
end
