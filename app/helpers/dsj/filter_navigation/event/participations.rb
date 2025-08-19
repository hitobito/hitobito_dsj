# frozen_string_literal: true

#  Copyright (c) 2012-2025, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.


module Dsj::FilterNavigation::Event::Participations
  def predefined_filters
    return [] if event.is_a? Event::Fundraising

    super
  end
end
