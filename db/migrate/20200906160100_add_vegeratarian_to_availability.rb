class AddVegeratarianToAvailability < ActiveRecord::Migration[6.0]
  def change
    add_column :availabilities, :vegetarian, :boolean, default: false, null: false
  end
end
