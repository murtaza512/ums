require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get index ajax" do
    get users_url, xhr: true
    assert_response :success
  end

  test "should get create" do
    params = {
      user: {
        name: Faker::Name.unique.name, email: Faker::Internet.email, phone: Faker::PhoneNumber.cell_phone, title: Faker::Lorem.word, status: 'inactive'
      }
    }
    post users_url, params: params, xhr: true
    assert_response :success
  end

  test "should get edit" do
    user = User.create({ name: Faker::Name.unique.name, email: Faker::Internet.email, phone: Faker::PhoneNumber.cell_phone, title: Faker::Lorem.word })
    get edit_user_url(user), xhr: true
    assert_response :success
  end

  test "should get destroy" do
    user = User.create({ name: Faker::Name.unique.name, email: Faker::Internet.email, phone: Faker::PhoneNumber.cell_phone, title: Faker::Lorem.word })
    delete user_url(user), xhr: true
    assert_response :success
  end

  test "should get update" do
    user = User.create({ name: Faker::Name.unique.name, email: Faker::Internet.email, phone: Faker::PhoneNumber.cell_phone, title: Faker::Lorem.word, status: 'active' })

    params = {
      user: {
        status: 'inactive',
        name: 'changed name'
      }
    }
    put user_url(user), params: params, xhr: true
    assert_response :success
    assert_equal user.reload.name, 'changed name'
    assert_equal user.status, 'inactive'
  end

end
