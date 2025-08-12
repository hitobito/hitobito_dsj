module Dsj::EventAbility
  extend ActiveSupport::Concern

  included do
    on(Event::Fundraising) do
      permission(:group_full).may(:list_fundraisings).in_same_group

      permission(:group_and_below_full).may(:list_fundraisings).in_same_group_or_below

      permission(:layer_full).may(:list_fundraisings).in_same_layer

      permission(:layer_and_below_full).may(:list_fundraisings).in_same_layer_or_below
    end
  end
end
