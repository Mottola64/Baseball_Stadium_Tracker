class Team < ActiveRecord::Base
  belongs_to :user
  belongs_to :stadia
end
