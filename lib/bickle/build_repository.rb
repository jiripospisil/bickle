module Bickle
  class BuildRepository
    BUILDS_URI     = "https://api.travis-ci.org/repos/%s/builds.json"

    def initialize(repository, client = HttpClient, response_parser = ResponseParser)
      @repository      = repository
      @client          = client
      @response_parser = response_parser
    end

    def fetch(limit = 25)
      response = @client.get(BUILDS_URI % @repository.name)

      builds   = @response_parser.parse(response).map do |build|
        Build.new(build)
      end

      builds.first(limit)
    end
  end
end
