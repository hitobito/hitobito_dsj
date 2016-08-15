# encoding: utf-8

#  Copyright (c) 2012-2016, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

module Dsj::Person
  extend ActiveSupport::Concern

  SALUTATIONS = %w(formal_f
                   formal_m
                   semi_formal_f
                   semi_formal_m
                   informal_f
                   informal_m
                   formal_f_m)

  included do
    # Define additional used attributes
    Person::PUBLIC_ATTRS << :function << :website << :contact_number << :salutation <<
        :salutation_addition

    i18n_enum :salutation, SALUTATIONS
    i18n_setter :salutation, SALUTATIONS + [nil]
  end

end
