#  Copyright (c) 2019, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

module Sheet
  class Note < Base
    self.parent_sheet = Sheet::Person

    def title
      I18n.t("notes.actions_edit.title")
    end

    def current_parent_nav_path
      view.group_people_path(parent_sheet.parent_sheet.entry.id,
        parent_sheet.entry.id)
    end
  end
end
