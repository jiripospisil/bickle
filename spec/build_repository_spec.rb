require "spec_helper"

module Bickle
  describe BuildRepository do
    it "returns builds" do
      http_client = mock("HttpClient")
      http_client.should_receive(:get) { "[{\"id\":1}, {\"id\":2}]"}

      builds = BuildRepository.new(Repository.new("rails"), http_client)
      builds.fetch.length.should equal 2
    end

    it "returns limited amount of results" do
      http_client = mock("HttpClient")
      http_client.should_receive(:get) { "[{\"id\":1}, {\"id\":2}]"}

      builds = BuildRepository.new(Repository.new("rails"), http_client)
      builds.fetch(1).length.should equal 1
    end
  end
end
