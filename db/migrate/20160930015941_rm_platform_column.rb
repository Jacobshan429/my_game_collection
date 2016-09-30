class RmPlatformColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :games, :platforms
  end
end
