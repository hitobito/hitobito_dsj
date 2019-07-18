class MakeLanguageMandatoryForPeople < ActiveRecord::Migration
  def change
    change_column_null :people, :correspondence_language, false, 'de'
  end
end
