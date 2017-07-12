class DefaultPrivateForSocialAccounts < ActiveRecord::Migration

  def up
    change_column_default :social_accounts, :public, false

    make_existing_social_accounts_private
  end

  def down
    change_column_default :social_accounts, :public, true
  end

  private

  def make_existing_social_accounts_private
    SocialAccount.find_each do |p|
      p.update!(public: false)
    end
  end

end
