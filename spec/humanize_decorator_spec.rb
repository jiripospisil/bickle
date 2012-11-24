require "spec_helper"

module Bickle
  describe HumanizeDecorator do
    it "correctly translates result value" do
      build = mock("Build", :"pass?" => true)
      decorator = HumanizeDecorator.new(build)
      decorator.result.should == "PASS"
    end
  end
end
