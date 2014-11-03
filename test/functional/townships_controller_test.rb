require 'test_helper'

class TownshipsControllerTest < ActionController::TestCase
  setup do
    @township = townships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:townships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create township" do
    assert_difference('Township.count') do
      post :create, township: { description: @township.description }
    end

    assert_redirected_to township_path(assigns(:township))
  end

  test "should show township" do
    get :show, id: @township
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @township
    assert_response :success
  end

  test "should update township" do
    put :update, id: @township, township: { description: @township.description }
    assert_redirected_to township_path(assigns(:township))
  end

  test "should destroy township" do
    assert_difference('Township.count', -1) do
      delete :destroy, id: @township
    end

    assert_redirected_to townships_path
  end
end
