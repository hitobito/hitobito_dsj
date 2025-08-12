module Dsj::Event::ParticipationAbility
  extend ActiveSupport::Concern

  included do
    on(Event::Participation) do
      permission(:group_full).may(:mail_confirmation).in_same_group_if_active_unless_fundraising
      permission(:group_and_below_full).may(:mail_confirmation).in_same_group_or_below_if_active_unless_fundraising
      permission(:layer_full).may(:mail_confirmation).in_same_layer_if_active_unless_fundraising
      permission(:layer_and_below_full).may(:mail_confirmation).in_same_layer_if_active_unless_fundraising

      permission(:any).may(:print).her_own_or_for_participations_full_events_unless_fundraising
      permission(:group_full).may(:print).in_same_group_unless_fundraising
      permission(:group_and_below_full).may(:print).in_same_group_or_below_unless_fundraising
      permission(:layer_full).may(:print).in_same_layer_or_different_prio_unless_fundraising
      permission(:layer_and_below_full).may(:print).in_same_layer_or_below_or_different_prio_unless_fundraising
    end
  end

  def in_same_group_if_active_unless_fundraising
    in_same_group_if_active unless event.is_a? Event::Fundraising
  end

  def in_same_group_or_below_if_active_unless_fundraising
    in_same_group_or_below_if_active unless event.is_a? Event::Fundraising
  end

  def in_same_layer_if_active_unless_fundraising
    in_same_layer_if_active unless event.is_a? Event::Fundraising
  end

  def her_own_or_for_participations_full_events_unless_fundraising
    her_own_or_for_participations_full_events unless event.is_a? Event::Fundraising
  end

  def in_same_group_unless_fundraising
    in_same_group unless event.is_a? Event::Fundraising
  end

  def in_same_group_or_below_unless_fundraising
    in_same_group_or_below unless event.is_a? Event::Fundraising
  end

  def in_same_layer_or_different_prio_unless_fundraising
    in_same_layer_or_different_prio unless event.is_a? Event::Fundraising
  end

  def in_same_layer_or_below_or_different_prio_unless_fundraising
    in_same_layer_or_below_or_different_prio unless event.is_a? Event::Fundraising
  end
end
