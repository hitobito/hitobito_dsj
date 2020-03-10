class AddPoliticalInfoToPeople < ActiveRecord::Migration[4.2]
  def change
    add_column :people, :political_party, :string
    add_column :people, :current_secondary_appointment, :string
  end
end
