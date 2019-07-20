class User < ActiveRecord::Base
  has_secure_password
  has_many :team
  has_many :stadiums, through: :team
end
