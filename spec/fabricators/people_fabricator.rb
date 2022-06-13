#  Copyright (c) 2019, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

Fabricator(:person_with_language, from: :person) do
  language { 'de' }
end
