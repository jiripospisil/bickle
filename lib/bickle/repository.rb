module Bickle
  class Repository
    def initialize(repository_name)
      @repository_name = parse_name(repository_name)
    end

    def name
      @repository_name
    end

    private

    def parse_name(name)
      regex = "[A-Za-z0-9_-]+"

      if name =~ Regexp.new("^#{regex}\/#{regex}$")
        name
      elsif name =~ Regexp.new("^#{regex}$")
        "#{name}/#{name}"
      else
        raise InvalidRepositoryNameError
      end
    end
  end
end
