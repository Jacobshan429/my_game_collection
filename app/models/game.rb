class Game < ApplicationRecord
  validates_presence_of :name
  has_many :players
  belongs_to :category
  has_many :game_platformships
  has_many :platforms, :through => :game_platformships

  delegate :name, :to => :category, :prefix => true, :allow_nil => true
end
