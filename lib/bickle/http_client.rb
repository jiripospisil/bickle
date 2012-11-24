module Bickle
  class HttpClient
    def self.get(url)
      RestClient.get(url)
    rescue => e
      raise HttpClientError, e.message
    end
  end
end
