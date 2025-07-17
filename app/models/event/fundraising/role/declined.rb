module Event::Fundraising::Role
  class Declined < ::Event::Role
    self.permissions = []

    self.kind = :participant
  end
end
