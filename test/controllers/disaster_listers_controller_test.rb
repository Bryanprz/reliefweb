require 'test_helper'

class DisasterListersControllerTest < ActionController::TestCase
  setup do
    @disaster_lister = disaster_listers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:disaster_listers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create disaster_lister" do
    assert_difference('DisasterLister.count') do
      post :create, disaster_lister: {  }
    end

    assert_redirected_to disaster_lister_path(assigns(:disaster_lister))
  end

  test "should show disaster_lister" do
    get :show, id: @disaster_lister
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @disaster_lister
    assert_response :success
  end

  test "should update disaster_lister" do
    patch :update, id: @disaster_lister, disaster_lister: {  }
    assert_redirected_to disaster_lister_path(assigns(:disaster_lister))
  end

  test "should destroy disaster_lister" do
    assert_difference('DisasterLister.count', -1) do
      delete :destroy, id: @disaster_lister
    end

    assert_redirected_to disaster_listers_path
  end
end
