class MakeLanguageMandatoryForPeople < ActiveRecord::Migration[4.2]
  def change
    change_column_null :people, :correspondence_language, false, 'de'
  end
end
