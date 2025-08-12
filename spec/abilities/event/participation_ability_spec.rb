require "spec_helper"

describe Event::ParticipationAbility do
  let(:event) { Fabricate(:event, groups: [role.group]) }
  let(:event_participation) { Fabricate(:event_participation, event: event) }

  let(:fundraising) { Fabricate(:dsj_fundraising, groups: [role.group]) }
  let(:fundraising_participation) { Fabricate(:event_participation, event: fundraising) }

  let(:ability) { Ability.new(role.person.reload) }

  subject { ability }

  context :layer_full do
    let(:role) { Fabricate(Group::JugendparlamentLeitung::Praesidium.name.to_sym, group: groups(:jupa_be_leitung)) }

    it "may send mail confirmation for events unless for fundraisings" do
      is_expected.to be_able_to(:mail_confirmation, event_participation)
      is_expected.to_not be_able_to(:mail_confirmation, fundraising_participation)
    end

    it "may print participations unless for fundraisings" do
      is_expected.to be_able_to(:print, event_participation)
      is_expected.to_not be_able_to(:print, fundraising_participation)
    end
  end

  context :group_and_below_full do
    let(:role) { Fabricate(Group::DachverbandProjektgruppe::Leitung.name.to_sym, group: groups(:dachverband_projektgruppe)) }

    it "may send mail confirmation for events unless for fundraisings" do
      is_expected.to be_able_to(:mail_confirmation, event_participation)
      is_expected.to_not be_able_to(:mail_confirmation, fundraising_participation)
    end

    it "may print participations unless for fundraisings" do
      is_expected.to be_able_to(:print, event_participation)
      is_expected.to_not be_able_to(:print, fundraising_participation)
    end
  end
end
