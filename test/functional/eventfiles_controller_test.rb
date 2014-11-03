require 'test_helper'

class EventfilesControllerTest < ActionController::TestCase
  setup do
    @eventfile = eventfiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:eventfiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create eventfile" do
    assert_difference('Eventfile.count') do
      post :create, eventfile: { event_id: @eventfile.event_id, hide_reason: @eventfile.hide_reason, upload: @eventfile.upload, user_id: @eventfile.user_id, visible: @eventfile.visible }
    end

    assert_redirected_to eventfile_path(assigns(:eventfile))
  end

  test "should show eventfile" do
    get :show, id: @eventfile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @eventfile
    assert_response :success
  end

  test "should update eventfile" do
    put :update, id: @eventfile, eventfile: { event_id: @eventfile.event_id, hide_reason: @eventfile.hide_reason, upload: @eventfile.upload, user_id: @eventfile.user_id, visible: @eventfile.visible }
    assert_redirected_to eventfile_path(assigns(:eventfile))
  end

  test "should destroy eventfile" do
    assert_difference('Eventfile.count', -1) do
      delete :destroy, id: @eventfile
    end

    assert_redirected_to eventfiles_path
  end
end
