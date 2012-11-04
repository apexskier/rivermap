require 'test_helper'

class RapidsControllerTest < ActionController::TestCase
  setup do
    @rapid = rapids(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rapids)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rapid" do
    assert_difference('Rapid.count') do
      post :create, rapid: { class: @rapid.class, description: @rapid.description, lat: @rapid.lat, lng: @rapid.lng, name: @rapid.name, river: @rapid.river, user_changed: @rapid.user_changed, user_created: @rapid.user_created }
    end

    assert_redirected_to rapid_path(assigns(:rapid))
  end

  test "should show rapid" do
    get :show, id: @rapid
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rapid
    assert_response :success
  end

  test "should update rapid" do
    put :update, id: @rapid, rapid: { class: @rapid.class, description: @rapid.description, lat: @rapid.lat, lng: @rapid.lng, name: @rapid.name, river: @rapid.river, user_changed: @rapid.user_changed, user_created: @rapid.user_created }
    assert_redirected_to rapid_path(assigns(:rapid))
  end

  test "should destroy rapid" do
    assert_difference('Rapid.count', -1) do
      delete :destroy, id: @rapid
    end

    assert_redirected_to rapids_path
  end
end
