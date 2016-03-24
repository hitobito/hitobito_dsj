# encoding: utf-8

#  Copyright (c) 2012-2016, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

module GroupsDsjHelper

  def format_group_language(group)
    I18n.t("activerecord.attributes.group.languages.#{group.language}")
  end

  def format_group_area(group)
    I18n.t("activerecord.attributes.group.areas.#{group.area}")
  end

  def format_group_legal_form(group)
    I18n.t("activerecord.attributes.group.legal_forms.#{group.legal_form}")
  end

  def format_group_state(group)
    I18n.t("activerecord.attributes.group.states.#{group.state}")
  end

end
