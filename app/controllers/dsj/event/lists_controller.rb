#  Copyright (c) 2025, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.
#
module Dsj::Event::ListsController
  def fundraisings
    authorize!(:list_fundraisings, Event::Fundraising)

    @nav_left = "fundraisings"

    @fundraisings = grouped(upcoming_fundraisings)
  end

  private

  def upcoming_fundraisings
    Event::Fundraising
      .upcoming
      .accessible_by(FundraisingReadables.new(current_user))
      .includes(:dates, :groups)
      .order("event_dates.start_at ASC")
  end

  def upcoming_user_events
    # Do not show fundraisings on events overview
    super.where("events.type != ? OR events.type IS NULL", Event::Fundraising.sti_name)
  end
end
