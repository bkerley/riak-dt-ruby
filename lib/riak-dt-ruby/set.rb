module RiakDt
  class Set
    attr_accessor :name
    def initialize(name)
      self.name = name
      @encoded_name = CGI.escape name
    end

    def add(atom)
      RiakDt.client.post "/sets/#{@encoded_name}/add", atom
      nil
    end

    def remove(atom)
      RiakDt.client.post "/sets/#{@encoded_name}/remove", atom
      nil
    end

    def contents
      response = RiakDt.client.get("/sets/#{@encoded_name}")
      return ::Set.new if response.status == 404
      
      parsed = JSON.parse response.body
      array = parsed[name]
      ::Set.new array
    end
  end
end
