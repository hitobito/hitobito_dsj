# encoding: utf-8

#  Copyright (c) 2012-2016, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

class Group::DachverbandExterneKontakte < Group

  children Group::DachverbandExterneKontakte

  ### ROLES

  class Adressverwaltung < ::Role
    self.permissions = [:group_and_below_full]
  end

  class Kontakt < ::Role; end

  roles Adressverwaltung, Kontakt

end
