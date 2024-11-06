# frozen_string_literal: true

#  Copyright (c) 2012-2024, Schweizer Alpen-Club. This file is part of
#  hitobito_sac_cas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sac_cas.

require "spec_helper"

describe SearchStrategies::PersonSearch do
  describe "#search_fulltext" do
    let(:user) { people(:admin) }

    before do
      user.update!(function: "Funktion 12", website: "hitobito.com", contact_number: "24052021")
    end

    it "finds accessible person by function" do
      result = search_class(user.function.to_s).search_fulltext

      expect(result).to include(user)
    end

    it "finds accessible person by website" do
      result = search_class(user.website.to_s).search_fulltext

      expect(result).to include(user)
    end

    it "finds accessible person by contact_number" do
      result = search_class(user.contact_number.to_s).search_fulltext

      expect(result).to include(user)
    end
  end

  def search_class(term = nil, page = nil)
    described_class.new(user, term, page)
  end
end