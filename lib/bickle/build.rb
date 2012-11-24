module Bickle
  class Build
    def initialize(build)
      @build   = build
    end

    def id
      @build["id"]
    end

    def repository_id
      @build["repository_id"]
    end

    def number
      @build["number"]
    end

    def state
      @build["state"]
    end

    def result
      @build["result"]
    end

    def started_at
      @build["started_at"]
    end

    def finished_at
      @build["finished_at"]
    end

    def duration
      @build["duration"]
    end

    def commit
      @build["commit"]
    end

    def branch
      @build["branch"]
    end

    def message
      message = @build["message"]
    end

    def event_type
      @build["event_type"]
    end

    def pass?
      result == 0
    end

    def fail?
      result == 1
    end

    def pending?
      result == nil
    end
  end
end
