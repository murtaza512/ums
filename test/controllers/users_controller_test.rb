require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    Searchkick.enable_callbacks

    @params =  {
      user: {
        name: Faker::Name.unique.name, email: Faker::Internet.email, phone: Faker::PhoneNumber.cell_phone, title: Faker::Lorem.word, status: 'inactive'
      }
    }

    @user = User.create(@params[:user])
  end

  def teardown
    Searchkick.disable_callbacks
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get create" do
    post users_url, params: @params, xhr: true
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user), xhr: true
    assert_response :success
  end

  test "should get destroy" do
    delete user_url(@user), xhr: true
    assert_response :success
  end

  test "should get update" do
    params = {
      user: {
        status: 'inactive',
        name: 'changed name'
      }
    }
    put user_url(@user), params: params, xhr: true
    assert_response :success
    assert_equal @user.reload.name, 'changed name'
    assert_equal @user.status, 'inactive'
  end
end
