module Bickle
  class ColorDecorator < SimpleDelegator
    def initialize(build, shell)
      @build = build
      @shell = shell
      super(@build)
    end

    def result
      res = @build.result

      if @build.pass?
        @shell.set_color(res, :green)
      elsif @build.fail?
        @shell.set_color(res, :red)
      else
        @shell.set_color(res, :yellow)
      end
    end
  end
end
