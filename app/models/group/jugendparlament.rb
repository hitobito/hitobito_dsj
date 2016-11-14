# encoding: utf-8

#  Copyright (c) 2012-2016, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

class Group::Jugendparlament < Group

  include I18nEnums

  LANGUAGES = %w(de fr it de_fr)
  AREAS = %w(local regional cantonal federal other)
  LEGAL_FORMS = %w(public private)
  STATES = %w(very_active active little_active passive on_hold founding interested)

  self.layer = true
  self.default_children = [Group::JugendparlamentLeitung,
                           Group::JugendparlamentVorstand,
                           Group::JugendparlamentMitglieder]

  self.used_attributes += [:founding_year, :language, :area, :legal_form, :budget,
                           :financial_backer, :members_age, :political_competences, :supervision,
                           :state, :member, :joining_year, :visited_events]

  children Group::JugendparlamentLeitung,
           Group::JugendparlamentVorstand,
           Group::JugendparlamentMitglieder,
           Group::JugendparlamentExterneKontakte,
           Group::JugendparlamentProjektgruppe

  i18n_enum :language, LANGUAGES
  i18n_enum :area, AREAS
  i18n_enum :legal_form, LEGAL_FORMS
  i18n_enum :state, STATES

  after_create :create_custom_named_default_children

  ### ROLES

  class << self
    def language_labels
      labels(LANGUAGES, :languages)
    end

    def area_labels
      labels(AREAS, :areas)
    end

    def legal_form_labels
      labels(LEGAL_FORMS, :legal_forms)
    end

    def state_labels
      labels(STATES, :states)
    end

    def labels(keys, prefix)
      keys.each_with_object({}) do |key, labels|
        labels[key] = I18n.t("activerecord.attributes.group.#{prefix}.#{key}")
      end
    end
  end

  private

  def create_custom_named_default_children
    %w(Behörden Alumni).each do |name|
      Group::JugendparlamentExterneKontakte.create!(name: name, parent: self)
    end
  end
end
