class User < ActiveRecord::Base
  has_secure_password
  has_many :teams
  has_many :teams, through: :stadia


end
