# encoding: utf-8

#  Copyright (c) 2017, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

require 'spec_helper'

describe PersonAbility do

  subject { ability }
  let(:ability) { Ability.new(role.person.reload) }
  let(:person)  { Fabricate(:person_with_language) }
  let(:leiter)  { Fabricate(:person_with_language) }

  context :show do
    let(:group) { Fabricate(Group::JugendparlamentMitglieder.name, parent: groups(:jupa_be_mitglieder)) }
    let(:mitglied) { Fabricate(Group::JugendparlamentMitglieder::Mitglied.name, group: group, person: person).person }

    context 'mitarbeiter' do
      let(:role) { Fabricate(Group::DachverbandGeschaeftsstelle::Mitarbeiter.name, group: groups(:dachverband_gs), person: leiter) }

      it 'may see mitglied' do
        is_expected.to be_able_to(:show, mitglied)
      end
    end
  end

  context 'group-permissions' do
    let(:group)    { groups(:dachverband_projektgruppe) }
    let(:mitglied) { Fabricate(Group::DachverbandProjektgruppe::Mitglied.name, group: group, person: person).person }
    let(:role)     { Fabricate(Group::DachverbandProjektgruppe::Leitung.name, group: group, person: leiter) }

    it 'may see mitglieds notes' do
      is_expected.to be_able_to(:index_notes, mitglied)
    end

    it 'may see mitglieds tags' do
      is_expected.to be_able_to(:show_tags, mitglied)
    end

    it 'may assign mitglieds tags' do
      is_expected.to be_able_to(:assign_tags, mitglied)
    end
  end

end
