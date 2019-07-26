class User < ActiveRecord::Base

  has_secure_password

  has_many :stadia, through: :teams


end
