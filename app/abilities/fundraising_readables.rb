# frozen_string_literal: true

#  Copyright (c) 2012-2025, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

class FundraisingReadables < GroupBasedFetchables
  self.same_group_permissions = [:group_full, :group_and_below_full]
  self.above_group_permissions = [:group_and_below_full]
  self.same_layer_permissions = [:layer_and_below_full, :layer_full]
  self.above_layer_permissions = [:layer_and_below_full]

  def initialize(user, scope = Event::Fundraising.all)
    super(user)

    @scope = scope

    can(:index, Event::Fundraising, accessible_fundraisings { |_| true })
  end

  private

  def accessible_fundraisings
    if user.root?
      @scope
    else
      accessible_fundraisings_scope
    end
  end

  def accessible_fundraisings_scope
    conditions = accessible_conditions
    if conditions.present?
      @scope
        .joins(:groups)
        .where(groups: {deleted_at: nil})
        .where(conditions.to_a)
        .distinct
    else
      Event::Fundraising.none
    end
  end

  def accessible_conditions
    OrCondition.new.tap do |condition|
      append_group_conditions(condition)
    end
  end
end
