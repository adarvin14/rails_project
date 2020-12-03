class CreateTournaments < ActiveRecord::Migration[6.0]
  def change
    create table :tounaments do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :registration_deadline
      t.integer :participants
      t.string :game_title
      t.boolean :completed

      t.timestamps
  end
end
