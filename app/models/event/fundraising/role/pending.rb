module Event::Fundraising::Role
  class Pending < ::Event::Role
    self.permissions = []

    self.kind = :participant
  end
end
