# frozen_string_literal: true

#  Copyright (c) 2012-2025, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

class Event::Fundraising < Event
  self.used_attributes -= [:maximum_participants,
    :location, :application_opening_at,
    :application_closing_at, :application_conditions,
    :external_applications, :applications_cancelable,
    :signature, :signature_confirmation, :signature_confirmation_text,
    :required_contact_attrs, :hidden_contact_attrs,
    :participations_visible, :globally_visible,
    :minimum_participants, :automatic_assignment]

  self.supports_invitations = false

  self.role_types = [
    Event::Fundraising::Role::Pending,
    Event::Fundraising::Role::Confirmed,
    Event::Fundraising::Role::Declined
  ]

  def application_possible?
    false
  end

  def supports_application_details?
    false
  end
end
