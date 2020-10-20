# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  context 'validations' do
    should validate_presence_of(:name)
    should validate_presence_of(:email)
    should validate_presence_of(:phone)
    should validate_presence_of(:status)
  end

  context 'enum status' do
    should define_enum_for(:status).with_values([:active, :inactive])
  end
end
