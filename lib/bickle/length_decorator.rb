module Bickle
  class LengthDecorator < SimpleDelegator
    def initialize(build, column_widths = {})
      @build         = build
      @column_widths = column_widths

      super(@build)
    end

    def state
      normalize_width(@build.state, "state", 10)
    end

    def commit
      normalize_width(@build.commit, "commit", 5)
    end

    def branch
      normalize_width(@build.branch, "branch", 10)
    end

    def message
      message = @build.message
      message = message.gsub(/\s+/, " ")
      message = message.strip

      normalize_width(message, "message", 50)
    end

    private

    def normalize_width(value, key, default)
      width = Integer(@column_widths[key] || default)
      value[0...width]
    end
  end
end
