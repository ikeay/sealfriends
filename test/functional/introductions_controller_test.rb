require 'test_helper'

class IntroductionsControllerTest < ActionController::TestCase
  setup do
    @introduction = introductions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:introductions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create introduction" do
    assert_difference('Introduction.count') do
      post :create, :introduction => @introduction.attributes
    end

    assert_redirected_to introduction_path(assigns(:introduction))
  end

  test "should show introduction" do
    get :show, :id => @introduction.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @introduction.to_param
    assert_response :success
  end

  test "should update introduction" do
    put :update, :id => @introduction.to_param, :introduction => @introduction.attributes
    assert_redirected_to introduction_path(assigns(:introduction))
  end

  test "should destroy introduction" do
    assert_difference('Introduction.count', -1) do
      delete :destroy, :id => @introduction.to_param
    end

    assert_redirected_to introductions_path
  end
end
