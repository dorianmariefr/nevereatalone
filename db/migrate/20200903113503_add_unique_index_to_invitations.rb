class AddUniqueIndexToInvitations < ActiveRecord::Migration[6.0]
  def change
    add_index :invitations, [:user_id, :availability_id], unique: true
  end
end
