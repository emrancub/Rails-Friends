class Friend < ApplicationRecord
  validates :first_name, :last_name, :phone_number, presence: true
  validates :email, presence: true, format: {
    with: /\A[^@\s]+@[^@\s]+\z/,
    message: "Must be valid Input"
  }

  belongs_to :user
end
