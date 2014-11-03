require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, event: { address: @event.address, area: @event.area, crime_id: @event.crime_id, description: @event.description, event_date: @event.event_date, latitude: @event.latitude, locality_id: @event.locality_id, longitude: @event.longitude, observations: @event.observations, place_id: @event.place_id, priority: @event.priority, reason_hide: @event.reason_hide, source: @event.source, status_id: @event.status_id, suburb: @event.suburb, township_id: @event.township_id, tramo_carretero: @event.tramo_carretero, user_id: @event.user_id, visible: @event.visible }
    end

    assert_redirected_to event_path(assigns(:event))
  end

  test "should show event" do
    get :show, id: @event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event
    assert_response :success
  end

  test "should update event" do
    put :update, id: @event, event: { address: @event.address, area: @event.area, crime_id: @event.crime_id, description: @event.description, event_date: @event.event_date, latitude: @event.latitude, locality_id: @event.locality_id, longitude: @event.longitude, observations: @event.observations, place_id: @event.place_id, priority: @event.priority, reason_hide: @event.reason_hide, source: @event.source, status_id: @event.status_id, suburb: @event.suburb, township_id: @event.township_id, tramo_carretero: @event.tramo_carretero, user_id: @event.user_id, visible: @event.visible }
    assert_redirected_to event_path(assigns(:event))
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to events_path
  end
end
