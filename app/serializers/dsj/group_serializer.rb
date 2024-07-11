#  Copyright (c) 2012-2016, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

module Dsj::GroupSerializer
  extend ActiveSupport::Concern

  included do
    extension(:attrs) do |_|
      map_properties :remarks, :members_count, :contact_history, :last_contact
    end
  end
end
