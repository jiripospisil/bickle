require "spec_helper"

module Bickle
  describe Repository do
    it "returns repo name when valid given" do
      repository = Repository.new("rails/rails")
      repository.name.should == "rails/rails"
    end

    it "allows to use a shortened version of repository name" do
      repository = Repository.new("rails")
      repository.name.should == "rails/rails"
    end

    it "raises error if name contains invalid characters" do
      expect do
        repository = Repository.new("ra ls")
      end.to raise_error(InvalidRepositoryNameError)

      expect do
        repository = Repository.new("rails/)(&@#")
      end.to raise_error(InvalidRepositoryNameError)
    end

    it "allows underscores and dashes in the repo name" do
      expect do
        repository = Repository.new("foo-bar/foo_bar")
      end.not_to raise_error(InvalidRepositoryNameError)

      expect do
        repository = Repository.new("foo_bar")
      end.not_to raise_error(InvalidRepositoryNameError)
    end
  end
end
