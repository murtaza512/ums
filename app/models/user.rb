# frozen_string_literal: true

class User < ApplicationRecord
  enum status: { active: 0, inactive: 1 }

  validates :email, presence: true, uniqueness: true
  validates :name, :phone, :status, presence: true

  scope :search, -> (value) { value.present? ? where("name ilike :search or email ilike :search or title ilike :search", search: "%#{value}%").or(where(status: User.statuses[value])) : all }
end
