# encoding: utf-8

#  Copyright (c) 2012-2016, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

require Rails.root.join('db', 'seeds', 'support', 'group_seeder')

seeder = GroupSeeder.new

dachverband = Group.roots.first
srand(42)

unless dachverband.address.present?
  # avoid callbacks to prevent creating default groups twice
  dachverband.update_columns(seeder.group_attributes)

  dachverband.default_children.each do |child_class|
    child_class.first.update_attributes(seeder.group_attributes)
  end
end

externalContacts = [
                    { name: 'Externe Kontakte', children:
                      [{ name: 'Behörden',
                        children: [{ name: 'Bund',
                                     children: [{ name: 'EEKJ' },
                                                { name: 'BSV' },
                                                { name: 'BK' },
                                                { name: 'Politiker NR/SR U35' },
                                                { name: 'Politiker NR/SR WBK' }]
                                   },
                                   { name: 'Kanton',
                                     children: [{ name: 'Jugenddelegierte' },
                                                { name: 'Kanzleien' }]
                                   },
                                   { name: 'Gemeinde',
                                     children: [{ name: 'Jugenddelegierte/Jugendarbeit' },
                                                { name: 'Kanzleien' }]
                                   }]
                      },
                      { name: 'Parteien',
                        children: [{ name: 'National', children: [{ name: 'Politiker' }] },
                                   { name: 'Jungparteien', children: [{ name: 'Jungpolitiker' }] }]
                      },
                      { name: 'Bildungsinstitutionen',
                        children: [{ name: 'Sekstufe 1' },
                                   { name: 'Berufsschulen' },
                                   { name: 'Gymnasien u.ä.' },
                                   { name: 'Hochschulen/Unis' },
                                   { name: 'Fachhochschulen' },
                                   { name: 'Päd. Hochschulen' },
                                   { name: 'Aus- und Weiterbildung für Lehrer' }]
                      },
                      { name: 'Eltern' },
                      { name: 'Jugendarbeit', children: [{ name: 'DOJ/OJA' }] },
                      { name: 'Jugendverbände' },
                      { name: 'Wissenschaft' },
                      { name: 'Verbände' },
                      { name: 'Privatwirtschaft' },
                      { name: 'Weitere Akteure' },
                      { name: 'Medien',
                        children: [{ name: 'Nationale Medien' },
                                   { name: 'Regionale Medien' },
                                   { name: 'Fachmedien' },
                                   { name: 'Jugendmedien' },
                                   { name: 'Onlinemedien' },
                                   { name: 'TV' },
                                   { name: 'Radio' },
                                   { name: 'Print' }]
                      },
                      { name: 'Messen' }
                    ]}
                  ]


def seedExternalContacts(contacts, parent_id)
  contacts.each do |contact|
    group = Group::DachverbandExterneKontakte.seed(:name, :parent_id,
                                                   { name: contact[:name], parent_id: parent_id })[0]
    seedExternalContacts(contact[:children], group.id) if contact[:children]
  end
end

seedExternalContacts(externalContacts, dachverband.id)

jupa_stati = ['Aktiv','Im Aufbau','Nicht mehr aktiv']

jupas = ['AG Jugendrat Wohlen',
         'BE Jugendparlament Berner Oberland',
         'BE Jugendparlament Köniz',
         'BE Jugendparlament Oberaargau JPO',
         'BE Jugendparlament Region Fraubrunnen JupF',
         'BE Jugendparlament Stadt Bern',
         'BE Jugendrat Heimberg',
         'BE Jugendrat Lyss',
         'BE Jugendrat Spiez',
         'BE Jugendrat Worb',
         'BE Jugenparlament Biel/Bienne',
         'BE Virtuelles Jupa Zollikofen',
         'BL Jugendrat Blauen',
         'FR Junge Politik Sense',
         'GE Jeunesse de Veyrier',
         'GE Parlement des Jeunes Chênois',
         'GL Jugendrat Glarus Nord',
         'GR Jugendparlament Stadt Chur',
         'LU Jugendparlament Emmen',
         'LU Jugendparlament Stadt Luzern',
         'LU Jugendparlament Wauwil',
         'LU Jugendrat Escholzmatt-Marbach JEM',
         'LU Jugendrat Nottwil',
         'LU Jugendrat Rothenburg',
         'NE Parlement des Jeunes de La Chaux-de-Fonds',
         'NE Parlement des Jeunes de la Ville de Neuchâtel',
         'SG Buchs You-Speak',
         'SG Jugendrat Rapperswil-Jona',
         'SO Jugendparlament Schwarzbubenland',
         'TI Parlamenti Assemblea Giovani Bellinzonesi AGB',
         'TI Parlamento dei Giovani Lugano',
         'VD Conseil des Jeunes de Bussigny',
         'VD Conseil des Jeunes de Chavornay',
         'VD Conseil des Jeunes de Lausanne',
         'VD Conseil des Jeunes de Plan-les-Ouates',
         'VD Conseil des Jeunes de Renens',
         'VD Conseil des Jeunes Yverdon',
         'VD Parlement des Jeunes de Blonay- St-Légier',
         'VD Parlement des Jeunes de Romanel',
         'VD Parlement des Jeunes Morges',
         'VS Jugendparlament Saas-Grund',
         'ZG Jugendrat Baar YouthVoice',
         'ZH Jugendparlament Horgen',
         'ZH Jugendrat Dielsdorf',
         'ZH Jugendrat Dübendorf',
         'ZH Jugendrat Rifferswil',
         'ZH Jugendrat Rüti']

Group::JugendparlamentStatus.seed(:name, :parent_id, *
                              jupa_stati.map { |status| {name: status, parent_id: dachverband.id } })

Group::Jugendparlament.seed(:name, :parent_id,
                           *jupas.map { |jupa| { name: jupa, parent_id: Group::JugendparlamentStatus.first.id } })

Group.rebuild!
