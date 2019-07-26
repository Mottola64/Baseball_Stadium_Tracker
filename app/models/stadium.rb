class Stadium < ActiveRecord::Base
has_many :teams
belongs_to :user
has_many :users, through: :teams
end
