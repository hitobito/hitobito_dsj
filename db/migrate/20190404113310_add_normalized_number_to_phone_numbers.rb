class AddNormalizedNumberToPhoneNumbers < ActiveRecord::Migration
  def change
    add_column :phone_numbers, :normalized, :string
    PhoneNumber.reset_column_information

    reversible do |dirs|
      dirs.up do
        say_with_time("normalizing phone-numbers into separate column") do
          PhoneNumber.find_each do |pn|
            pn.normalized = pn.number.gsub(/\D/, '').presence
            pn.save!
          end
        end
      end
    end
  end
end
