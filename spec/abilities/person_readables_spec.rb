# encoding: utf-8

#  Copyright (c) 2017, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

require 'spec_helper'

describe PersonReadables do

  context 'Mitarbeiter' do

    let(:role)  { Fabricate(Group::DachverbandGeschaeftsstelle::Mitarbeiter.name, group: groups(:dachverband_gs)) }
    let(:user)  { role.person.reload }
    let(:group) { groups(:jupa_be_mitglieder) }

    subject { Person.accessible_by(ability) }

    context 'in a lower layer' do
      let(:ability) { PersonReadables.new(user, group) }

      it 'may see people' do
        other = Fabricate(Group::JugendparlamentMitglieder::Mitglied.name, group: group)
        is_expected.to include(other.person)
      end
    end

    context 'in same group' do
      let(:group)   { role.group }
      let(:ability) { PersonReadables.new(user, group) }

      it 'may see people' do
        other = Fabricate(role.class.name, group: group)
        is_expected.to include(other.person)
      end
    end

    context 'in globally' do
      let(:ability) { PersonReadables.new(user, nil) }

      it 'may see people' do
        other = Fabricate(Group::JugendparlamentMitglieder::Mitglied.name, group: group)
        is_expected.to include(other.person)
      end
    end
  end

  context 'Vorstandsmitglied' do

    let(:role)  { Fabricate(Group::DachverbandVorstand::Vorstandsmitglied.name, group: groups(:dachverband_vorstand)) }
    let(:user)  { role.person.reload }
    let(:group) { groups(:jupa_be_mitglieder) }

    subject { Person.accessible_by(ability) }

    context 'in a lower layer' do
      let(:ability) { PersonReadables.new(user, group) }

      it 'may see people' do
        other = Fabricate(Group::JugendparlamentMitglieder::Mitglied.name, group: group)
        is_expected.to include(other.person)
      end
    end

    context 'in same group' do
      let(:group)   { role.group }
      let(:ability) { PersonReadables.new(user, group) }

      it 'may see people' do
        other = Fabricate(role.class.name, group: group)
        is_expected.to include(other.person)
      end
    end

    context 'in globally' do
      let(:ability) { PersonReadables.new(user, nil) }

      it 'may see people' do
        other = Fabricate(Group::JugendparlamentMitglieder::Mitglied.name, group: group)
        is_expected.to include(other.person)
      end
    end
  end

end
