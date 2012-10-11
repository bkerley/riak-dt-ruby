%w{faraday cgi json}.each do |f|
  require f
end
%w{version set counter}.each do |f|
  require_relative "riak-dt-ruby/#{f}"
end


module RiakDt
  def self.client
    @client ||= Faraday.new url: 'http://localhost:8091/' do |builder|
      builder.adapter :net_http
    end
  end
end
