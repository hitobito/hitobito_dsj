class AddFinancialSupportToPerson < ActiveRecord::Migration
  def change
  	add_column :people, :financial_support, :text
    Person.reset_column_information
  end
end