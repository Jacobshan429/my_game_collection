class Platform < ApplicationRecord
  has_many :game_platformships
  has_many :games , :through => :game_platformships
end
