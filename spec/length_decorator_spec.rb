require "spec_helper"

module Bickle
  describe LengthDecorator do
    it "limits the output when explicitly asked" do
      build = mock("Build", message: "abcd")
      decorator = LengthDecorator.new(build, "message" => 2)
      decorator.message.should == "ab"
    end

    it "applies default limits" do
      build = mock("Build", 
                   state: "a" * 15,
                   commit: "a" * 10,
                   branch: "a" * 15,
                   message: "a" * 55)

      decorator = LengthDecorator.new(build)
      decorator.state.should   == "a" * 10
      decorator.commit.should  == "a" * 5
      decorator.branch.should  == "a" * 10
      decorator.message.should == "a" * 50
    end
  end
end
