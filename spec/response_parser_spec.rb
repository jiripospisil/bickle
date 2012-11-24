require "spec_helper"

module Bickle
  describe ResponseParser do
    it "returns JSON when given valid input" do
      result = ResponseParser.parse("{\"a\": 123}")
      result.should == {"a" => 123}
    end

    it "returns error on invalid input" do
      expect do
        ResponseParser.parse("foo")
      end.to raise_error(InvalidResponseError)
    end
  end
end
