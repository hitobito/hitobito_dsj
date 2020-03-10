class AddDsjGroupFields < ActiveRecord::Migration[4.2]
  def change
    add_column :groups, :founding_year, :integer
    add_column :groups, :language, :string
    add_column :groups, :area, :string
    add_column :groups, :legal_form, :string
    add_column :groups, :budget, :string
    add_column :groups, :financial_backer, :string
    add_column :groups, :members_age, :string
    add_column :groups, :political_competences, :text
    add_column :groups, :supervision, :string
    add_column :groups, :state, :string
    add_column :groups, :member, :boolean
    add_column :groups, :joining_year, :integer
    add_column :groups, :visited_events, :text

    Group.reset_column_information
  end
end
