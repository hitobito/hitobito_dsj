# frozen_string_literal: true

#  Copyright (c) 2012-2025, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.


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
