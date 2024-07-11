#  Copyright (c) 2012-2016, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

class Group::DachverbandIntern < Group
  self.default_children = [Group::DachverbandGeschaeftsstelle, Group::DachverbandVorstand]

  children Group::DachverbandGeschaeftsstelle,
    Group::DachverbandVorstand,
    Group::DachverbandProjektgruppe

  ### ROLES
end
