# encoding: utf-8

#  Copyright (c) 2017, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

module Dsj::PersonReadables
  extend ActiveSupport::Concern

  included do
    alias_method_chain :accessible_people, :mitarbeiter
    alias_method_chain :layer_and_below_read_in_above_layer?, :mitarbeiter
  end

  def accessible_people_with_mitarbeiter
    if user_is_mitarbeiter_or_vorstandsmitglied?
      Person.only_public_data
            .joins(roles: :group)
            .where(roles: { deleted_at: nil }, groups: { deleted_at: nil })
    else
      accessible_people_without_mitarbeiter
    end
  end

  def layer_and_below_read_in_above_layer_with_mitarbeiter?
    user_is_mitarbeiter_or_vorstandsmitglied? ||
      layer_and_below_read_in_above_layer_without_mitarbeiter?
  end

  private

  def user_is_mitarbeiter_or_vorstandsmitglied?
    user.roles.any? do |role|
      role.is_a?(Group::DachverbandGeschaeftsstelle::Mitarbeiter) ||
        role.is_a?(Group::DachverbandVorstand::Vorstandsmitglied)
    end
  end

end
