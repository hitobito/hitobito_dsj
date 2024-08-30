#  Copyright (c) 2024, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

require "spec_helper"

describe SearchStrategies::PersonSearch do
  before do
    people(:member).update!(function: "Schlammsammler", website: "Lemurenshop", contact_number: 01234,
                            tag_list: ["Ruby", "Rails"], phone_numbers: [
        Fabricate(:phone_number, contactable_type: "Freund",
                  label: "Label",
                  number: "0792845673",
                  public: false,
                  contactable_id: 1)
      ])
  end

  describe "#search_fulltext" do
    let(:user) { people(:admin) }

    it "finds accessible person by function" do
      result = search_class(people(:member).function.to_s).search_fulltext
      expect(result).to include(people(:member))
    end

    it "finds accessible person by website" do
      result = search_class(people(:member).website.to_s).search_fulltext
      expect(result).to include(people(:member))
    end

    it "finds accessible person by contact number" do
      result = search_class(people(:member).contact_number.to_s).search_fulltext
      expect(result).to include(people(:member))
    end

    it "finds accessible person by tags" do
      result = search_class(people(:member).tags.first.name).search_fulltext
      expect(result).to include(people(:member))
    end

    it "finds accessible person by phone numbers" do
      result = search_class(people(:member).phone_numbers.first.normalized.to_s).search_fulltext
      expect(result).to include(people(:member))
    end
  end

  def search_class(term = nil, page = nil)
    described_class.new(user, term, page)
  end
end