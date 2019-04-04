# encoding: utf-8

#  Copyright (c) 2012-2016, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

module Dsj::Export::Tabular::People
  module PersonRow

    def salutation
      entry.salutation_label
    end

    def correspondence_language
      lang = entry.correspondence_language
      if lang
        Settings.application.correspondence_languages.to_hash.with_indifferent_access[lang]
      end
    end

  end
end
