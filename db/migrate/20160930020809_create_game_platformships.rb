class CreateGamePlatformships < ActiveRecord::Migration[5.0]
  def change
    create_table :game_platformships do |t|
      t.integer :game_id
      t.integer :platform_id

      t.timestamps
    end
    add_index :game_platformships, :game_id
    add_index :game_platformships, :platform_id
  end
end
