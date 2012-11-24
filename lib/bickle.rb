require "bickle/version"
require "bickle/errors"

require "rest_client"
require "delegate"

module Bickle
  autoload :Runner, "bickle/runner"

  autoload :Build, "bickle/build"
  autoload :Repository, "bickle/repository"
  autoload :BuildRepository, "bickle/build_repository"

  autoload :LengthDecorator, "bickle/length_decorator"
  autoload :HumanizeDecorator, "bickle/humanize_decorator"
  autoload :ColorDecorator, "bickle/color_decorator"

  autoload :HttpClient, "bickle/http_client"
  autoload :ResponseParser, "bickle/response_parser"

  autoload :ThorBuildsTable, "bickle/thor_builds_table"
end
