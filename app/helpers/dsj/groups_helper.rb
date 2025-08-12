module Dsj::GroupsHelper
  def tab_event_participants_label(entry)
    return I18n.t("events.tabs.supporters") if entry.is_a? Event::Fundraising

    super
  end
end
