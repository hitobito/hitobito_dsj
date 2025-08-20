# frozen_string_literal: true

#  Copyright (c) 2012-2025, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

require "spec_helper"

describe EventAbility do
  let(:fundraising) { Fabricate(:dsj_fundraising, groups: [role.group]) }

  let(:ability) { Ability.new(role.person.reload) }

  subject { ability }

  context :layer_full do
    let(:role) { Fabricate(Group::JugendparlamentLeitung::Praesidium.name.to_sym, group: groups(:jupa_be_leitung)) }

    it "may list fundraisings" do
      is_expected.to be_able_to(:list_fundraisings, Event::Fundraising)
    end
  end

  context :group_and_below_full do
    let(:role) { Fabricate(Group::DachverbandProjektgruppe::Leitung.name.to_sym, group: groups(:dachverband_projektgruppe)) }

    it "may list fundraisings" do
      is_expected.to be_able_to(:list_fundraisings, Event::Fundraising)
    end
  end
end
