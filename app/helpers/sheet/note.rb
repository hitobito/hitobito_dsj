#  Copyright (c) 2019, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

module Sheet
  class Note < Base
    delegate :t, to: :I18n

    def title
      t('notes.actions_edit.title')
    end

  end
end
