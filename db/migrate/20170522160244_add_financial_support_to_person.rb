class AddFinancialSupportToPerson < ActiveRecord::Migration[4.2]
  def change
    add_column :people, :financial_support, :text
    Person.reset_column_information
  end
end
