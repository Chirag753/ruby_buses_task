require_relative 'graph' # including the program saved in a file named graph.rb
require 'rspec'
RSpec.describe Graph do
  subject(:graph) { Graph.new('input.txt') }

  describe "#get_distance" do
    it "returns the distance of the road A-B-C" do
      expect(graph.get_distance(["A", "B", "C"])).to eq(9)
    end

    it "returns the distance of the road A-D" do
      expect(graph.get_distance(["A", "D"])).to eq(5)
    end

    it "returns the distance of the road A-D-C" do
      expect(graph.get_distance(["A", "D", "C"])).to eq(13)
    end

    it "returns the distance of the road A-E-B-C-D" do
      expect(graph.get_distance(["A", "E", "B", "C", "D"])).to eq(22)
    end

    it "returns 'NO SUCH ROAD' for the road A-E-D" do
      expect(graph.get_distance(["A", "E", "D"])).to eq("NO SUCH ROAD")
    end
  end

  describe "#count_trips_with_max_stops" do
    it "returns the number of trips starting at C and ending at C with a maximum of 3 stops" do
      expect(graph.count_trips_with_max_stops("C", "C", 3)).to eq(2)
    end
  end

  describe "#count_trips_with_exact_stops" do
    it "returns the number of trips starting at A and ending at C with exactly 4 stops" do
      expect(graph.count_trips_with_exact_stops("A", "C", 4)).to eq(3)
    end
  end

  describe "#shortest_distance" do
    it "returns the length of the shortest road (in terms of distance to travel) from A to C" do
      expect(graph.shortest_distance("A", "C")).to eq(9)
    end

    it "returns the length of the shortest road (in terms of distance to travel) from B to B" do
      expect(graph.shortest_distance("B", "B")).to eq(0)
    end
  end

  describe "#count_paths_within_distance" do
    it "returns the number of different roads from C to C with a distance of less than 30" do
      expect(graph.count_paths_within_distance("C", "C", 30)).to eq(7)
    end
  end
end