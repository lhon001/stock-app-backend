class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :username, presence: true
  validates :password, presence: true

  has_many :portfolios
  has_many :stocks, through: :portfolios
end
