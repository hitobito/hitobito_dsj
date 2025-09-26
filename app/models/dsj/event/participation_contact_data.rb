#  Copyright (c) 2019, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

module Dsj::Event::ParticipationContactData
  extend ActiveSupport::Concern

  included do
    Event.possible_contact_attrs << :contact_number <<
      :salutation << :salutation_addition << :language <<
      :political_party << :current_secondary_appointment

    delegate(*Event.possible_contact_attrs, to: :person)
  end
end
