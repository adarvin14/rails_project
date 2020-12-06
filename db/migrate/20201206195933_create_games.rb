class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :title
      t.integer :release_year
      t.integer :hours_played
      t.boolean :online_multiplayer
      t.boolean :campaign
      t.boolean :campaign_completed
    
      t.timestamps
    end
  end
end
