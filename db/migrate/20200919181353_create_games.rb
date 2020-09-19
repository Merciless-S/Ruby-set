class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :score
      t.integer :cardsleft
      t.string :card1
      t.string :card2
      t.string :card3
      t.string :card4
      t.string :card5
      t.string :card6
      t.string :card7
      t.string :card8
      t.string :card9
      t.string :card10
      t.string :card11
      t.string :card12

      t.timestamps
    end
  end
end
