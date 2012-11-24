module Bickle
  class ThorBuildsTable
    def initialize(headers, builds, shell)
      @headers = headers
      @builds  = builds
      @shell   = shell
    end

    def render
      rows = @builds.map do |build|
        @headers.map do |header|
          build.send header
        end
      end

      @shell.print_table(rows)
    end
  end
end
