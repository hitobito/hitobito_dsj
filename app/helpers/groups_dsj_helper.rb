# encoding: utf-8

#  Copyright (c) 2012-2016, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

module GroupsDsjHelper

  def format_group_language(group)
    group.language_label
  end

  def format_group_area(group)
    group.area_label
  end

  def format_group_legal_form(group)
    group.legal_form_label
  end

  def format_group_state(group)
    group.state_label
  end

  def format_group_supervision_kind(group)
    group.supervision_kind_label
  end

end
