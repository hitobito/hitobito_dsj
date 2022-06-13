# frozen_string_literal: true

class RenameCorrespondanceLanguageToLanguageOnPerson < ActiveRecord::Migration[6.1]

  def up
    if ActiveRecord::Base.connection.column_exists?(:people, :language)
      remove_column :people, :language
    end

    rename_column :people, :correspondence_language, :language
    change_column :people, :language, :string, default: default_language, null: false

    Person.reset_column_information
  end

  def down
    rename_column :people, :language, :correspondence_language

    Person.reset_column_information
  end

  private

  def default_language
    Settings.application.languages.keys.first
  end
end
