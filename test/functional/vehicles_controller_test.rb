require 'test_helper'

class VehiclesControllerTest < ActionController::TestCase
  setup do
    @vehicle = vehicles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vehicles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vehicle" do
    assert_difference('Vehicle.count') do
      post :create, vehicle: { brand: @vehicle.brand, color: @vehicle.color, line: @vehicle.line, model: @vehicle.model, person_id: @vehicle.person_id, plate: @vehicle.plate, registered_from: @vehicle.registered_from, serial_number: @vehicle.serial_number, status: @vehicle.status, stolen: @vehicle.stolen }
    end

    assert_redirected_to vehicle_path(assigns(:vehicle))
  end

  test "should show vehicle" do
    get :show, id: @vehicle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vehicle
    assert_response :success
  end

  test "should update vehicle" do
    put :update, id: @vehicle, vehicle: { brand: @vehicle.brand, color: @vehicle.color, line: @vehicle.line, model: @vehicle.model, person_id: @vehicle.person_id, plate: @vehicle.plate, registered_from: @vehicle.registered_from, serial_number: @vehicle.serial_number, status: @vehicle.status, stolen: @vehicle.stolen }
    assert_redirected_to vehicle_path(assigns(:vehicle))
  end

  test "should destroy vehicle" do
    assert_difference('Vehicle.count', -1) do
      delete :destroy, id: @vehicle
    end

    assert_redirected_to vehicles_path
  end
end
