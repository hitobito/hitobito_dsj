# encoding: utf-8

#  Copyright (c) 2012-2016, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

require 'spec_helper'

describe Person do
  context 'salutation' do
    subject { described_class.new(nickname: 'Testino', salutation: 'informal_m_de', correspondence_language: 'de') }

    it 'translates salutations' do
      expect(subject.salutation).to eq 'informal_m_de'
      expect(subject.salutation_label).to eq 'Lieber'
    end

    it 'accepts translated salutations and stores them normalized' do
      subject.salutation = 'Liebe'
      expect(subject.salutation).to eq 'informal_f_de'
    end

    context 'validations' do
      it 'unknown ones are invalid' do
        subject.salutation = 'Hey Kumpel'
        expect(subject).to_not be_valid
        expect(subject.errors).to have_key :salutation
      end

      it 'known ones are valid' do
        subject.salutation = 'Sehr geehrte Frau'
        expect(subject).to be_valid
      end

      it 'empty is allowed' do
        subject.salutation = ' '
        expect(subject).to be_valid
      end

    end
  end

  context 'correspondence_language' do
    subject { described_class.new(nickname: 'Testino', correspondence_language: 'de') }

    it 'is mandatory' do
      subject.correspondence_language = nil
      expect(subject).to_not be_valid
    end

    it 'unknown languages are invalid' do
      subject.correspondence_language = 'ja'
      expect(subject).to_not be_valid
    end

    it 'known languages are valid' do
      %w(de it fr en rm).each do |language|
        subject.correspondence_language = language
        expect(subject).to be_valid
      end
    end
  end
end
