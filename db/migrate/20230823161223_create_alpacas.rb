class CreateAlpacas < ActiveRecord::Migration[7.0]
  def change
    create_table :alpacas do |t|
      t.string :name
      t.string :colour
      t.string :hat
      t.string :location
      t.decimal :price_per_night
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
