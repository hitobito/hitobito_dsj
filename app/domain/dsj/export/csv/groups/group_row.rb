# encoding: utf-8

#  Copyright (c) 2012-2017, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

module Dsj::Export::Csv::Groups
  module GroupRow
    extend ActiveSupport::Concern

    def language
      entry.language_label if entry.language
    end

    def area
      entry.area_label if entry.area
    end

    def legal_form
      entry.legal_form_label if entry.legal_form
    end

    def state
      entry.state_label if entry.state
    end

  end
end
