require "spec_helper"

describe Event::ListsController do
  include ActiveSupport::Testing::TimeHelpers

  before do
    travel_to(Time.zone.local(2025, 7, 15))
    sign_in(user)
  end

  describe "GET fundraisings" do
    context "as leader" do
      let(:user) { people(:leader) }

      before do
        now = Time.zone.now

        @next_fundraising = Fabricate(:dsj_fundraising,
          groups: [groups(:jupa_be_leitung)],
          dates: [
            Fabricate(:event_date, start_at: now + 5.days, finish_at: now + 10.days)
          ])

        _past_fundraising = Fabricate(:dsj_fundraising,
          groups: [groups(:jupa_be_leitung)],
          dates: [
            Fabricate(:event_date, start_at: now - 10.days, finish_at: now - 5.days)
          ])
      end

      it "contains only current and upcoming fundraisings" do
        get :fundraisings

        expect(assigns(:fundraisings).values.flatten).to eq [@next_fundraising]
      end
    end

    context "as member" do
      let(:user) { people(:member) }

      it "is not allowed" do
        expect { get :fundraisings }.to raise_error(CanCan::AccessDenied)
      end
    end
  end
end
