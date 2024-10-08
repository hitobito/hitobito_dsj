# frozen_string_literal: true

#  Copyright (c) 2012-2023, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

module HitobitoDsj
  class Wagon < Rails::Engine
    include Wagons::Wagon

    # Set the required application version.
    app_requirement ">= 0"

    # Add a load path for this specific wagon
    config.autoload_paths += %W[
      #{config.root}/app/abilities
      #{config.root}/app/domain
      #{config.root}/app/jobs
    ]

    config.to_prepare do
      # extend application classes here

      # abilities
      NoteAbility.include Dsj::NoteAbility
      PersonAbility.include Dsj::PersonAbility
      PersonReadables.include Dsj::PersonReadables

      # models
      Group.include Dsj::Group
      Person.include Dsj::Person
      Event::ParticipationContactData.include Dsj::Event::ParticipationContactData
      PhoneNumber.include Dsj::PhoneNumber

      # serializers
      GroupSerializer.include Dsj::GroupSerializer
      PersonSerializer.include Dsj::PersonSerializer

      # controllers
      PeopleController.permitted_attrs += [:function, :website, :contact_number, :salutation,
        :salutation_addition, :financial_support,
        :political_party,
        :current_secondary_appointment]
      NotesController.include Dsj::NotesController

      # exports
      Export::Tabular::Groups::Row.include Dsj::Export::Tabular::Groups::Row
      Export::Tabular::People::PeopleAddress.include Dsj::Export::Tabular::People::PeopleAddress
      Export::Tabular::People::PersonRow.include Dsj::Export::Tabular::People::PersonRow
    end

    initializer "dsj.add_settings" do |_app|
      Settings.add_source!(File.join(paths["config"].existent, "settings.yml"))
      Settings.reload!
    end

    initializer "dsj.add_inflections" do |_app|
      ActiveSupport::Inflector.inflections do |inflect|
        # inflect.irregular 'census', 'censuses'
      end
    end

    private

    def seed_fixtures
      fixtures = root.join("db", "seeds")
      ENV["NO_ENV"] ? [fixtures] : [fixtures, File.join(fixtures, Rails.env)]
    end
  end
end
