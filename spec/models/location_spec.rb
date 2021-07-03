require "spec_helper"

describe Location do
  describe ".ordered_by_name" do
    it "orders the locations based on alpahbetical order" do
      locations = [
        create(:location, name: "location1"),
        create(:location, name: "location3"),
        create(:location, name: "location2")
      ]

      result = Location.ordered_by_name

      expect(result.pluck(:name)).to eq(%w(
        location1
        location2
        location3
      ))
    end
  end
end
