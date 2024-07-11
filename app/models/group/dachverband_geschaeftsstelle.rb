#  Copyright (c) 2012-2016, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

class Group::DachverbandGeschaeftsstelle < ::Group
  ### ROLES

  class Admin < ::Role
    self.permissions = [:layer_and_below_full, :admin, :contact_data]
  end

  class Mitarbeiter < ::Role
    self.permissions = [:group_read, :contact_data]
  end

  roles Admin, Mitarbeiter
end
