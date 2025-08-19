# frozen_string_literal: true

#  Copyright (c) 2012-2025, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.


module Dsj::Sheet::Group
  extend ActiveSupport::Concern

  included do
    tabs.insert(
      3,
      Sheet::Tab.new("activerecord.models.event/fundraising.other",
        :fundraising_group_events_path,
        params: {returning: true},
        if: lambda do |view, group|
          group.event_types.include?(::Event::Fundraising) &&
            view.can?(:"index_event/fundraisings", group)
        end)
    )
  end
end
