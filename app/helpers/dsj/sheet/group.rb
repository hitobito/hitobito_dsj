module Dsj::Sheet::Group
  extend ActiveSupport::Concern

  included do
    tabs.insert(
      3,
      Sheet::Tab.new("activerecord.models.event/fundraising.other",
        :fundraising_group_events_path,
        params: {returning: true},
        if: lambda do |view, group|
          group.event_types.include?(::Event::Fundraising) &&
            view.can?(:"index_event/fundraisings", group)
        end)
    )
  end
end
