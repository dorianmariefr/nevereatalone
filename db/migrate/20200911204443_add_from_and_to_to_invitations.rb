class AddFromAndToToInvitations < ActiveRecord::Migration[6.0]
  def change
    rename_column :invitations, :user_id, :to_user_id

    add_reference :invitations, :from_user

    Invitation.find_each do |invitation|
      invitation.update!(from_user_id: invitation.availability.user_id)
    end

    change_column :invitations, :from_user_id, :bigint, null: false
    add_foreign_key :invitations, :users, column: :from_user_id
  end
end
