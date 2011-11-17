require 'test_helper'

class DerivacionsControllerTest < ActionController::TestCase
  setup do
    @derivacion = derivacions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:derivacions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create derivacion" do
    assert_difference('Derivacion.count') do
      post :create, :derivacion => @derivacion.attributes
    end

    assert_redirected_to derivacion_path(assigns(:derivacion))
  end

  test "should show derivacion" do
    get :show, :id => @derivacion.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @derivacion.to_param
    assert_response :success
  end

  test "should update derivacion" do
    put :update, :id => @derivacion.to_param, :derivacion => @derivacion.attributes
    assert_redirected_to derivacion_path(assigns(:derivacion))
  end

  test "should destroy derivacion" do
    assert_difference('Derivacion.count', -1) do
      delete :destroy, :id => @derivacion.to_param
    end

    assert_redirected_to derivacions_path
  end
end
