# frozen_string_literal: true

#  Copyright (c) 2012-2025, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

require "spec_helper"

describe FundraisingReadables do
  let(:person) { people(:member) }

  it "group_and_below_full can access group" do
    Fabricate(Group::DachverbandProjektgruppe::Leitung.name, group: groups(:dachverband_projektgruppe), person: person)
    fundraising = Fabricate(:dsj_fundraising, groups: [groups(:dachverband_projektgruppe)])

    accessable_fundraisings = Event::Fundraising.accessible_by(described_class.new(person))

    expect(accessable_fundraisings).to eq [fundraising]
  end

  it "group_and_below_full can not access other group" do
    Fabricate(Group::DachverbandProjektgruppe::Leitung.name, group: groups(:dachverband_projektgruppe), person: person)
    Fabricate(:dsj_fundraising, groups: [groups(:dachverband_vorstand)])

    accessable_fundraisings = Event::Fundraising.accessible_by(described_class.new(person))

    expect(accessable_fundraisings).to eq []
  end

  it "layer_and_below_full can access group in same layer" do
    Fabricate(Group::DachverbandGeschaeftsstelle::Admin.name, group: groups(:dachverband_gs), person: person)
    fundraising = Fabricate(:dsj_fundraising, groups: [groups(:dachverband_vorstand)])

    accessable_fundraisings = Event::Fundraising.accessible_by(described_class.new(person))

    expect(accessable_fundraisings).to eq [fundraising]
  end

  it "layer_full can access group in same layer" do
    Fabricate(Group::JugendparlamentLeitung::Praesidium.name, group: groups(:jupa_be_leitung), person: person)
    fundraising = Fabricate(:dsj_fundraising, groups: [groups(:jupa_be_leitung)])

    accessable_fundraisings = Event::Fundraising.accessible_by(described_class.new(person))

    expect(accessable_fundraisings).to eq [fundraising]
  end

  it "layer_full can not access group in other layer" do
    Fabricate(Group::JugendparlamentLeitung::Praesidium.name, group: groups(:jupa_be_leitung), person: person)
    Fabricate(:dsj_fundraising, groups: [groups(:dachverband_vorstand)])

    accessable_fundraisings = Event::Fundraising.accessible_by(described_class.new(person))

    expect(accessable_fundraisings).to eq []
  end
end
