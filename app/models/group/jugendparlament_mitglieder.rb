# encoding: utf-8

#  Copyright (c) 2012-2016, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

class Group::JugendparlamentMitglieder < Group

  children Group::JugendparlamentMitglieder

  ### ROLES

  class Adressverwaltung < ::Role
    self.permissions = [:group_full]
  end

  class Mitglied < ::Role; end

  roles Adressverwaltung, Mitglied

end
