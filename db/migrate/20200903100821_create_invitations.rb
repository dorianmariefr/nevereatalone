class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :availability, null: false, foreign_key: true
      t.string :status, null: false

      t.timestamps
    end
  end
end
