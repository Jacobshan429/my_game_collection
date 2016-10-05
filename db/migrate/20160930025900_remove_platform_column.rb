class RemovePlatformColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :games, :platform
  end
end
