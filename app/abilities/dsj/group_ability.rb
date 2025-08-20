# frozen_string_literal: true

#  Copyright (c) 2012-2025, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

module Dsj::GroupAbility
  extend ActiveSupport::Concern

  included do
    on(Group) do
      permission(:layer_full).may(:"index_event/fundraisings").in_same_layer

      permission(:layer_and_below_full).may(:"index_event/fundraisings").in_same_layer_or_below

      permission(:group_full).may(:"index_event/fundraisings").in_same_group

      permission(:group_and_below_full).may(:"index_event/fundraisings").in_same_group_or_below
    end
  end
end
