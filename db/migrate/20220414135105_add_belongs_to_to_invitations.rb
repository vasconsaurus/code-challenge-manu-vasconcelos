class AddBelongsToToInvitations < ActiveRecord::Migration[7.0]
  def change
    add_column :invitations, :cycle_id, :integer
    add_foreign_key :invitations, :cycles
  end
end
