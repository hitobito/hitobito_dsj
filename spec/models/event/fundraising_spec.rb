# frozen_string_literal: true

#  Copyright (c) 2012-2026, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

require "spec_helper"

describe Event::Fundraising do
  it "has role types in the order of the fundraising process" do
    expect(described_class.role_types).to eq [
      Event::Fundraising::Role::ToClarify,
      Event::Fundraising::Role::Planned,
      Event::Fundraising::Role::Pending,
      Event::Fundraising::Role::Deferred,
      Event::Fundraising::Role::Confirmed,
      Event::Fundraising::Role::Declined
    ]
  end

  it "can add a participant with a new role type" do
    fundraising = Fabricate(:dsj_fundraising, groups: [groups(:dachverband)])
    participation = Fabricate(:event_participation, event: fundraising, participant: people(:admin))
    role = Event::Fundraising::Role::Planned.create!(participation: participation)

    expect(role.model_name.human).to eq "Geplant"
    expect(participation.reload.roles).to eq [role]
  end
end
