# encoding: utf-8

#  Copyright (c) 2012-2016, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

module Dsj::Person
  extend ActiveSupport::Concern

  included do
    # Define additional used attributes
    Person::PUBLIC_ATTRS << :function << :website << :contact_number << :salutation <<
        :salutation_addition << :financial_support << :correspondence_language <<
        :political_party << :current_secondary_appointment

    Person::SALUTATIONS = [
      [:formal_f_de, 'Sehr geehrte Frau'], [:formal_m_de, 'Sehr geehrter Herr'],
      [:semi_formal_f_de, 'Liebe Frau'],   [:semi_formal_m_de, 'Lieber Herr'],
      [:informal_f_de, 'Liebe'],           [:informal_m_de, 'Lieber'],
      [:formal_f_m_de, 'Sehr geehrte Damen und Herren'],

      [:formal_f_fr, 'Madame'],            [:formal_m_fr, 'Monsieur'],
      [:semi_formal_f_fr, 'Chère Madame'], [:semi_formal_m_fr, 'Cher Monsieur'],
      [:informal_f_fr, 'Chère'],           [:informal_m_fr, 'Cher'],
      [:formal_f_m_fr, 'Mesdames, Messieurs'],

      [:formal_f_it, 'Gentile Signora'],   [:formal_m_it, 'Egregio Signor'],
      [:semi_formal_f_it, 'Signora'],      [:semi_formal_m_it, 'Signor'],
      [:informal_f_it, 'Cara'],            [:informal_m_it, 'Caro'],
      [:formal_f_m_it, 'Gentili Signore, Egregi Signori']
    ].freeze

    validates :salutation, inclusion: Person::SALUTATIONS.map { |k, _| k.to_s }, allow_blank: true
    validates :correspondence_language,
              inclusion: {
                in: lambda do |_|
                  Settings.application.correspondence_languages.to_hash.keys.map(&:to_s)
                end
              }
  end

  def salutation_label
    if salutation.present?
      entry = Person::SALUTATIONS.find { |s| s.first.to_s == salutation.to_s }
      entry ? entry.second : salutation
    end
  end

  def salutation=(value)
    super(value)

    normalized = value.to_s.strip.downcase
    Person::SALUTATIONS.each do |key, translated|
      super(key) if translated.downcase == normalized
    end

    value # rubocop:disable Lint/Void I humbly disagree with rubocop on this one. setters should return the passed value
  end

end
