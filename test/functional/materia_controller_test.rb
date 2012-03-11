require 'test_helper'

class MateriaControllerTest < ActionController::TestCase
  setup do
    @materium = materia(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:materia)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create materium" do
    assert_difference('Materium.count') do
      post :create, :materium => @materium.attributes
    end

    assert_redirected_to materium_path(assigns(:materium))
  end

  test "should show materium" do
    get :show, :id => @materium.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @materium.to_param
    assert_response :success
  end

  test "should update materium" do
    put :update, :id => @materium.to_param, :materium => @materium.attributes
    assert_redirected_to materium_path(assigns(:materium))
  end

  test "should destroy materium" do
    assert_difference('Materium.count', -1) do
      delete :destroy, :id => @materium.to_param
    end

    assert_redirected_to materia_path
  end
end
