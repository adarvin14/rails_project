class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create tables :games do |t|
      t.string :title

      t.timstamps
  end
end
