module Bickle
  class HumanizeDecorator < SimpleDelegator
    def initialize(build)
      @build = build
      super
    end

    def result
      if @build.pass?
        "PASS"
      elsif @build.fail?
        "FAIL"
      else
        "PENDING"
      end
    end
  end
end
