# encoding: utf-8

#  Copyright (c) 2017, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

module Dsj::PersonAbility
  extend ActiveSupport::Concern

  included do
    on(Person) do
      permission(:any).may(:show).if_geschaeftsstellen_mitarbeiter

      permission(:group_full)
        .may(:index_tags, :manage_tags, :index_notes)
        .non_restricted_in_same_group

      permission(:group_and_below_full)
        .may(:index_tags, :manage_tags, :index_notes)
        .non_restricted_in_same_group_or_below

    end
  end

  def if_geschaeftsstellen_mitarbeiter
    user.roles.any? do |role|
      role.is_a?(Group::DachverbandGeschaeftsstelle::Mitarbeiter)
    end
  end

end
