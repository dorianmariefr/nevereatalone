class CreateAvailabilities < ActiveRecord::Migration[6.0]
  def change
    create_table :availabilities do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :starts_at, null: false
      t.string :location, null: false

      t.timestamps
    end
  end
end
