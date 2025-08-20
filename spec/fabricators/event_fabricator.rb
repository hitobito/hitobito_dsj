# frozen_string_literal: true

#  Copyright (c) 2012-2025, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

Fabricator(:dsj_fundraising, from: :event, class_name: :"Event::Fundraising") do
  dates { [Fabricate(:event_date, start_at: 5.days.from_now, finish_at: 10.days.from_now)] }
end
