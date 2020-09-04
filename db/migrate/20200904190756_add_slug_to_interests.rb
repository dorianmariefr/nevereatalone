class AddSlugToInterests < ActiveRecord::Migration[6.0]
  def change
    add_column :interests, :slug, :string

    Interest.find_each(&:save!)

    change_column :interests, :slug, :string, null: false
    add_index :interests, :slug, unique: true
  end
end
