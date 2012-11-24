require "spec_helper"

module Bickle
  describe HttpClient do
    it "handles standard errors" do
      RestClient.should_receive(:get).with("foo").and_raise(StandardError)

      expect do
        HttpClient.get("foo")
      end.to raise_error(HttpClientError)
    end
  end
end
