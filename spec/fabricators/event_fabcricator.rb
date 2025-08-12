Fabricator(:dsj_fundraising, from: :event, class_name: :"Event::Fundraising") do
  dates { [Fabricate(:event_date, start_at: 5.days.from_now, finish_at: 10.days.from_now)] }
end
