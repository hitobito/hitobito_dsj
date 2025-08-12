require "spec_helper"

describe GroupAbility do
  let(:ability) { Ability.new(role.person.reload) }

  subject { ability }

  context :layer_full do
    let(:role) { Fabricate(Group::JugendparlamentLeitung::Praesidium.name.to_sym, group: groups(:jupa_be_leitung)) }

    it "may index_event fundraisings" do
      is_expected.to be_able_to(:"index_event/fundraisings", role.group)
      is_expected.to_not be_able_to(:"index_event/fundraisings", groups(:dachverband_gs))
    end
  end

  context :group_and_below_full do
    let(:role) { Fabricate(Group::DachverbandProjektgruppe::Leitung.name.to_sym, group: groups(:dachverband_projektgruppe)) }

    it "may list fundraisings" do
      is_expected.to be_able_to(:"index_event/fundraisings", role.group)
      is_expected.to_not be_able_to(:"index_event/fundraisings", groups(:dachverband_gs))
    end
  end
end
