# encoding: utf-8

#  Copyright (c) 2012-2021, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

require Rails.root.join('db', 'seeds', 'support', 'person_seeder')

class DsjPersonSeeder < PersonSeeder

  def amount(role_type)
    mass_role = %w(Kontakt Mitglied Abonnent Communitymitglied)
    if mass_role.include?(role_type.name.demodulize)
      5
    else
      1
    end
  end

  def standard_attributes(*args)
    super.merge({
      correspondence_language: 'de',
    })
  end
end

puzzlers = ['Pascal Zumkehr',
            'Pierre Fritsch',
            'Andreas Maierhofer',
            'Mathis Hofer',
            'Andre Kunz',
            'Pascal Simon',
            'Matthias Viehweger',
            'Roland Studer']

devs = {
  'Maurus Blumenthal' => 'maurus.blumenthal@dsj.ch',
  'Jochanan Harari' => 'jochanan.harari@dsj.ch',
  'Severin Marty' => 'severin.marty@dsj.ch'
}
puzzlers.each do |puz|
  devs[puz] = "#{puz.split.last.downcase}@puzzle.ch"
end

seeder = DsjPersonSeeder.new

seeder.seed_all_roles

office = Group.find_by(name: "Geschäftsstelle")

devs.each do |name, email|
  seeder.seed_developer(name, email, office, Group::DachverbandGeschaeftsstelle::Mitarbeiter)
end

seeder.assign_role_to_root(office, Group::DachverbandGeschaeftsstelle::Mitarbeiter)
