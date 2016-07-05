# encoding: utf-8

#  Copyright (c) 2012-2016, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

require 'spec_helper'

describe Group::Jugendparlament do

  context 'custom named default children' do
    it 'creates \'Behörden\' and \'Alumni\'' do
      jupa = Group::Jugendparlament.create!(name: 'jupa', parent: groups(:jugendparlament_status))
      externe_kontakte = jupa.children.where(type: 'Group::JugendparlamentExterneKontakte').
                                       order(:name)
      expect(externe_kontakte.map(&:name)).to eq(%w(Alumni Behörden))
    end
  end

end
