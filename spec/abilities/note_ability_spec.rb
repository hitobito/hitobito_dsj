# encoding: utf-8

#  Copyright (c) 2017, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe NoteAbility do

  subject { ability }
  let(:ability) { Ability.new(role.person.reload) }
  let(:person)  { Fabricate(:person_with_language) }
  let(:leiter)  { Fabricate(:person_with_language) }

  context :group_and_below_full do
    let(:role) { Fabricate(Group::DachverbandProjektgruppe::Leitung.name.to_sym, group: groups(:dachverband_projektgruppe), person: leiter) }

    it 'may create and destroy note in his group' do
      other = Fabricate(Group::DachverbandProjektgruppe::Mitglied.name, group: groups(:dachverband_projektgruppe), person: person).person
      note = create_note(role.person, other)
      is_expected.to be_able_to(:create, note)
      is_expected.to be_able_to(:destroy, note)
    end

  end

  def create_note(author, person)
    Note.create!(
      author: author,
      subject: person,
      text: 'Lorem ipsum'
    )
  end

end
