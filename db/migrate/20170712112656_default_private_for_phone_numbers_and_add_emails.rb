class DefaultPrivateForPhoneNumbersAndAddEmails < ActiveRecord::Migration[4.2]

  def up
    change_column_default :phone_numbers, :public, false
    change_column_default :additional_emails, :public, false

    make_existing_phonenumbers_private
    make_existing_additional_emails_private
  end

  def down
    change_column_default :phone_numbers, :public, true
    change_column_default :additional_emails, :public, true
  end

  private

  def make_existing_phonenumbers_private
    PhoneNumber.reset_column_information
    PhoneNumber.find_each do |p|
      p.update!(public: false)
    end
  end

  def make_existing_additional_emails_private
    AdditionalEmail.reset_column_information
    AdditionalEmail.find_each do |p|
      p.update!(public: false)
    end
  end

end
