class Stadium < ActiveRecord::Base
has_many :teams
belongs_to :user
has_many :user_id
end
