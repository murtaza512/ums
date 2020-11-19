# frozen_string_literal: true

class User < ApplicationRecord
  searchkick stem: false

  enum status: { active: 0, inactive: 1 }

  validates :email, presence: true, uniqueness: true
  validates :name, :phone, :status, presence: true

  def search_data
    {
      name: name,
      email: email,
      title: title,
      status: status,
      updated_at: updated_at,
      phone: phone
    }
  end
end
