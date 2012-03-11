require 'test_helper'

class HorarioMateriaControllerTest < ActionController::TestCase
  setup do
    @horario_materium = horario_materia(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:horario_materia)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create horario_materium" do
    assert_difference('HorarioMaterium.count') do
      post :create, :horario_materium => @horario_materium.attributes
    end

    assert_redirected_to horario_materium_path(assigns(:horario_materium))
  end

  test "should show horario_materium" do
    get :show, :id => @horario_materium.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @horario_materium.to_param
    assert_response :success
  end

  test "should update horario_materium" do
    put :update, :id => @horario_materium.to_param, :horario_materium => @horario_materium.attributes
    assert_redirected_to horario_materium_path(assigns(:horario_materium))
  end

  test "should destroy horario_materium" do
    assert_difference('HorarioMaterium.count', -1) do
      delete :destroy, :id => @horario_materium.to_param
    end

    assert_redirected_to horario_materia_path
  end
end
