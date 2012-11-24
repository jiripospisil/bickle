require "spec_helper"

module Bickle
  describe Bickle do
    it "returns builds for the given repository" do
      HttpClient.should_receive(:get) { "[{\"result\": 0}]"}

      argv = ["builds", "rails", "-c", "result"]
      capture(:stdout) do
        Runner.start(argv)
      end.should include "PASS"
    end
  end
end
