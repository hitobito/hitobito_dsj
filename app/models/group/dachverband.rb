# encoding: utf-8

#  Copyright (c) 2012-2016, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

class Group::Dachverband < Group

  self.layer = true
  self.default_children = [Group::DachverbandGeschaeftsstelle, Group::DachverbandVorstand]

  children Group::DachverbandGeschaeftsstelle,
           Group::DachverbandVorstand,
           Group::DachverbandExterneKontakte,
           Group::DachverbandGremium,
           Group::Jugendparlament,
           Group::Easyvote

  ### ROLES

  class Adressverwaltung < ::Role
    self.permissions = [:layer_full]
  end

  roles Adressverwaltung

end
