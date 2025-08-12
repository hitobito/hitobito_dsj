class Event::Fundraising < Event
  self.used_attributes -= [:motto, :maximum_participants,
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
