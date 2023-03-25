class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :number
      t.references :nationality, null: false, foreign_key: true
      t.references :team, null: true, foreign_key: true
      t.date :birthdate
      t.string :position, limit: 1

      t.timestamps
    end
  end
end
