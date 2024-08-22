#  Copyright (c) 2024, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

require "spec_helper"

describe SearchStrategies::GroupSearch do
  before do
    groups(:dachverband_intern).update!(contact_history: "Very important contacts", remarks: "Some cool remarks")
  end

  describe "#search_fulltext" do
    let(:user) { people(:admin) }

    # :contact_history << :remarks
    it "finds accessible groups by contact history" do
      result = search_class(groups(:dachverband_intern).contact_history.to_s).search_fulltext
      expect(result).to include(groups(:dachverband_intern))
    end

    it "finds accessible groups by remarks" do
      result = search_class(groups(:dachverband_intern).remarks).search_fulltext
      expect(result).to include(groups(:dachverband_intern))
    end
  end

  def search_class(term = nil, page = nil)
    described_class.new(user, term, page)
  end
end