class AddSalutationToPerson < ActiveRecord::Migration[4.2]
  def change
    add_column :people, :salutation, :string
    add_column :people, :salutation_addition, :string
    Group.reset_column_information
  end
end
