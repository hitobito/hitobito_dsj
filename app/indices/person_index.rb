#  Copyright (c) 2012-2016, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

module PersonIndex; end

ThinkingSphinx::Index.define_partial :person do
  indexes function, website, contact_number
  indexes tags.name, as: :tag

  indexes phone_numbers.normalized, as: :normalized_phone_number
end
