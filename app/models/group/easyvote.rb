# encoding: utf-8

#  Copyright (c) 2012-2016, Dachverband Schweizer Easyvotee. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

class Group::Easyvote < Group

  self.layer = true
  self.default_children = [Group::EasyvoteAbonnenten, Group::EasyvoteCommunity]

  children Group::EasyvoteAbonnenten,
           Group::EasyvoteCommunity,
           Group::EasyvoteExterneKontakte

  ### ROLES

  class Adressverwaltung < ::Role
    self.permissions = [:layer_full]
  end

  roles Adressverwaltung

end
