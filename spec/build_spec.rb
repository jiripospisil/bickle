module Bickle
  describe Build do
    it "returns plain build values" do
      build = {
        "id" => 42,
      }

      build = Build.new(build)
      build.id.should == 42
    end

    it "reports correct status" do
      build_pass = Build.new("result" => 0)
      build_pass.pass?.should be_true

      build_fail = Build.new("result" => 1)
      build_fail.fail?.should be_true

      build_pending = Build.new("result" => nil)
      build_pending.pending?.should be_true
    end
  end
end
