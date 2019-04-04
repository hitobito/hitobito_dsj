class AddPoliticalInfoToPeople < ActiveRecord::Migration
  def change
    add_column :people, :political_party, :string
    add_column :people, :current_secondary_appointment, :string
  end
end
