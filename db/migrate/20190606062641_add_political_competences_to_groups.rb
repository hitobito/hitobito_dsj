class AddPoliticalCompetencesToGroups < ActiveRecord::Migration[4.2]
  def change
    bool_defaults = { null: false, default: false }

    change_table :groups do |t|
      t.boolean :competence_initiative,       bool_defaults
      t.boolean :competence_consultation,     bool_defaults
      t.boolean :competence_council_meeting,  bool_defaults
      t.boolean :competence_other,            bool_defaults
      t.boolean :competence_none,             bool_defaults
      t.boolean :competence_unknown,          bool_defaults

      t.string :supervision_kind, null: false, default: 'unknown'
    end

    Group.reset_column_information
  end
end
