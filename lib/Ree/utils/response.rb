# coding: utf-8

module Ree
  class Response < Rack::Response

    def self.build(result=[])
      raise "NoResult" if result.size != 3

      response = self.new
      response.status = result[0]
      response.body = result[2]
      result[1].each do |k, v|
        response.header[k] = v
      end
      response
    end

  end
end
