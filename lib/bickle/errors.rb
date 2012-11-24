module Bickle
  class Error < StandardError; end
  class HttpClientError < Error; end
  class InvalidRepositoryNameError < Error; end
  class InvalidResponseError < Error; end
end
