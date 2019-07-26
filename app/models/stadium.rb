class Stadium < ActiveRecord::Base
# has_many :teams
# has_many :users, through: :teams
belongs_to :user
end
