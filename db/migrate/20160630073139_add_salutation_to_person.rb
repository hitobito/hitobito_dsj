class AddSalutationToPerson < ActiveRecord::Migration
  def change
    add_column :people, :salutation, :string
    add_column :people, :salutation_addition, :string
    Group.reset_column_information
  end
end
