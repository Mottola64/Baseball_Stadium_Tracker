class Stadium < ActiveRecord::Base
has_many :teams
belongs_to :user
belongs_to :user_id
end
