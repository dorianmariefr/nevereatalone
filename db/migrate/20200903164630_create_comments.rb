class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :from_user, null: false, foreign_key: { to_table: :users }
      t.references :to_user, null: false, foreign_key: { to_table: :users }
      t.text :content, null: false
      t.boolean :recommend, null: false, default: true

      t.timestamps
    end
  end
end
