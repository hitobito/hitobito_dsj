module Event::Fundraising::Role
  class Confirmed < ::Event::Role
    self.permissions = []

    self.kind = :participant
  end
end
