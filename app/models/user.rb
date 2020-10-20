# frozen_string_literal: true

class User < ApplicationRecord
  enum status: { active: 0, inactive: 1 }

  validates :email, presence: true, uniqueness: true
  validates :name, :phone, :status, presence: true
end
