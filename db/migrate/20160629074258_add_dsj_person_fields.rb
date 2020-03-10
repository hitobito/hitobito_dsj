class AddDsjPersonFields < ActiveRecord::Migration[4.2]
  def change
    add_column :people, :function, :string
    add_column :people, :contact_number, :string
    add_column :people, :website, :string

    Person.reset_column_information
  end
end
