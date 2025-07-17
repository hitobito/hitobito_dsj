module Dsj::FilterNavigation::Event::Participations
  def predefined_filters
    return [] if event.is_a? Event::Fundraising

    super
  end
end
