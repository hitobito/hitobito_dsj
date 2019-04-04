#  Copyright (c) 2019, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

module Dsj::PhoneNumber
  extend ActiveSupport::Concern

  included do
    after_validation :normalize_number
  end

  def normalize_number
    self.normalized = number.gsub(/\D/, '').presence
  end
end
