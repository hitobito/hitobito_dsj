# encoding: utf-8

#  Copyright (c) 2012-2019, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

module Dsj::PersonSerializer
  extend ActiveSupport::Concern

  included do
    extension(:public) do |_|
      map_properties :function, :website
    end

    extension(:details) do |_|
      map_properties :contact_number, :salutation, :salutation_addition,
                     :correspondence_language, :financial_support,
                     :political_party, :current_secondary_appointment
      property :salutation, item.salutation_label
    end
  end

end
