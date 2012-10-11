module RiakDt
  class Counter
    attr_accessor :name
    def initialize(name)
      self.name = name
      @encoded_name = CGI.escape name
    end

    def increment
      RiakDt.client.post "/counters/#{@encoded_name}/increment"
      nil
    end

    def decrement
      RiakDt.client.post "/counters/#{@encoded_name}/decrement"
      nil
    end

    def value
      response = RiakDt.client.get("/counters/#{@encoded_name}")
      return 0 if response.status == 404
      return Integer(response.body)
    end
  end
end
