class User < ApplicationRecord
  enum :role, { admin: 0, customer: 1 }
  has_secure_password

  has_one :cart, dependent: :destroy
end
