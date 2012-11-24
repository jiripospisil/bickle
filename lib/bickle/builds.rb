require "json"

module Bickle
  class Builds
    BUILDS_URI     = "https://api.travis-ci.org/repos/%s/builds.json"
    DEFAULT_NUMBER = 25

    def initialize(repository, options = {})
      @repository = repository
      @options = options
    end

    def self.for(repository, options = {})
      new(repository, options).for
    end

    def for(client = HttpClient, response_parser = ResponseParser)
      response = client.get(BUILDS_URI % @repository)
      builds   = response_parser.parse(response)

      builds.first(@options["number_of_builds"] || DEFAULT_NUMBER)
    end
  end
end
