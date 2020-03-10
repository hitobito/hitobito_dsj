class AddAdditionalFieldsToGroup < ActiveRecord::Migration[4.2]
  def change
    add_column :groups, :remarks, :text
    add_column :groups, :members_count, :string
    add_column :groups, :contact_history, :text
    add_column :groups, :last_contact, :string
    Group.reset_column_information
  end
end
