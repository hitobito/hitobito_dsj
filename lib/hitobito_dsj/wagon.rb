# encoding: utf-8

#  Copyright (c) 2012-2016, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

module HitobitoDsj
  class Wagon < Rails::Engine
    include Wagons::Wagon

    # Set the required application version.
    app_requirement '>= 0'

    # Add a load path for this specific wagon
    config.autoload_paths += %W( #{config.root}/app/abilities
                                 #{config.root}/app/domain
                                 #{config.root}/app/jobs
                               )

    config.to_prepare do
      # rubocop:disable SingleSpaceBeforeFirstArg
      # extend application classes here

      # models
      Group.send        :include, Dsj::Group
      Person.send       :include, Dsj::Person

      # serializers
      GroupSerializer.send :include, Dsj::GroupSerializer
      PersonSerializer.send :include, Dsj::PersonSerializer

      # controllers
      PeopleController.permitted_attrs += [:function, :website, :contact_number, :salutation,
                                           :salutation_addition]

      # exports
      Export::Csv::Groups::GroupRow.send :include, Dsj::Export::Csv::Groups::GroupRow
      Export::Csv::People::PeopleAddress.send :include, Dsj::Export::Csv::People::PeopleAddress
      Export::Csv::People::PeopleFull.send :include, Dsj::Export::Csv::People::PeopleFull
      Export::Csv::People::PersonRow.send :include, Dsj::Export::Csv::People::PersonRow

      # rubocop:enable SingleSpaceBeforeFirstArg
    end

    initializer 'dsj.add_settings' do |_app|
      Settings.add_source!(File.join(paths['config'].existent, 'settings.yml'))
      Settings.reload!
    end

    initializer 'dsj.add_inflections' do |_app|
      ActiveSupport::Inflector.inflections do |inflect|
        # inflect.irregular 'census', 'censuses'
      end
    end

    private

    def seed_fixtures
      fixtures = root.join('db', 'seeds')
      ENV['NO_ENV'] ? [fixtures] : [fixtures, File.join(fixtures, Rails.env)]
    end

  end
end
