require "spec_helper"

module Bickle
  describe ColorDecorator do
    it "applies colors to the output" do
      build = mock("Build", :"pass?" => true, :result => 0)
      shell = mock("Shell")
      shell.should_receive(:set_color).with(build.result, :green) { "_PASS_" }

      decorator = ColorDecorator.new(build, shell)
      decorator.result.should include("_PASS_")
    end
  end
end
