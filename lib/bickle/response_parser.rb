require "json"

module Bickle
  class ResponseParser
    def self.parse(data)
      JSON.parse(data)
    rescue => e
      raise InvalidResponseError, e.message
    end
  end
end

