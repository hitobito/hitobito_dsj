module Dsj::Sheet::Group
  extend ActiveSupport::Concern

  included do
    tabs.insert(
      3,
      Sheet::Tab.new("groups.tabs.fundraisings",
        :fundraising_group_events_path)
      # TODO: who can see this?
    )
  end
end
