require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  setup do
    @person = people(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create person" do
    assert_difference('Person.count') do
      post :create, person: { alias: @person.alias, birth_date: @person.birth_date, ci: @person.ci, first_name: @person.first_name, genre: @person.genre, hide_reason: @person.hide_reason, last_name2: @person.last_name2, last_name: @person.last_name, observations: @person.observations, originative: @person.originative, profession: @person.profession, record: @person.record, registered_from: @person.registered_from, searchable: @person.searchable, status_id: @person.status_id, visible: @person.visible }
    end

    assert_redirected_to person_path(assigns(:person))
  end

  test "should show person" do
    get :show, id: @person
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @person
    assert_response :success
  end

  test "should update person" do
    put :update, id: @person, person: { alias: @person.alias, birth_date: @person.birth_date, ci: @person.ci, first_name: @person.first_name, genre: @person.genre, hide_reason: @person.hide_reason, last_name2: @person.last_name2, last_name: @person.last_name, observations: @person.observations, originative: @person.originative, profession: @person.profession, record: @person.record, registered_from: @person.registered_from, searchable: @person.searchable, status_id: @person.status_id, visible: @person.visible }
    assert_redirected_to person_path(assigns(:person))
  end

  test "should destroy person" do
    assert_difference('Person.count', -1) do
      delete :destroy, id: @person
    end

    assert_redirected_to people_path
  end
end