class AddColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :last_play_time, :datetime
    add_column :games, :release_day, :date
  end
end
