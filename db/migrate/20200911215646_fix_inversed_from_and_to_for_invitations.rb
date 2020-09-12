class FixInversedFromAndToForInvitations < ActiveRecord::Migration[6.0]
  def change
    remove_index :invitations, column: [:to_user_id, :availability_id]
    add_index :invitations, [:availability_id, :from_user_id, :to_user_id], unique: true, name: :unique_availability_from_and_to

    Invitation.find_each do |invitation|
      invitation.update!(from_user: invitation.to_user, to_user: invitation.from_user)
    end
  end
end
