class AddDetailsToAvailabilities < ActiveRecord::Migration[6.0]
  def change
    add_column :availabilities, :details, :string
  end
end
