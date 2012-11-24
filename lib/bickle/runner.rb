require "thor"

module Bickle
  class Runner < Thor

    desc "builds REPOSITORY", "Show latest builds of a repository"
    long_desc <<-D
      Show latest builds of a given repository. The repository
      must be publicly available through the Travis API. 
      
      The format of [REPOSITORY] is "username/repository". Note that 
      if the username is the same as the repository name, you can use
      "foo" instead of "foo/foo".

      Examples:

        $ bickle builds rails\n
        $ bickle builds plataformatec/devise -n 10\n
        $ bickle builds ryanb/cancan -c id message result\n
        $ bickle builds pry/pry -c id message result -w message:20
    D

    method_option :"number-of-builds", :type => :numeric, :aliases => "-n", default: 25, :desc => "Number of builds to display"
    method_option :columns, :type => :array, :aliases => "-c", default: ["id", "branch", "commit", "message", "state", "result"], :desc => "Columns to display"
    method_option :"columns-width", :type => :hash, :aliases => "-w", default: {}, :desc => "Width of specified columns"
    method_option :"no-color", :type => :boolean, :aliases => "-b", default: false, :desc => "Do not use colors"
    method_option :"no-humanize", :type => :boolean, :aliases => "-h", default: false, :desc => "Do not translate result values"

    def builds(repository_name)
      repository = Repository.new(repository_name)

      builds = BuildRepository.new(repository).
        fetch(options["number-of-builds"])

      builds = builds.map do |build| 
        LengthDecorator.new(build, options["columns-width"]) 
      end 

      builds = builds.map do |build| 
        HumanizeDecorator.new(build) 
      end unless options["no-humanize"]

      builds = builds.map do |build| 
        ColorDecorator.new(build, shell) 
      end unless options["no-color"]

      table = ThorBuildsTable.new(options["columns"], builds, shell)
      table.render
    end

    desc "show ID", "Show details about build with the given ID"
    long_desc <<-D
      Show details about build with the given ID. The ID must be
      associated with a publicly available repository. You can get
      the ID by using the "builds" command.

      Example:

        $ bickle build 123
    D

    def build(id)
      say "Not implemented yet."
      exit 0
    end
  end
end
