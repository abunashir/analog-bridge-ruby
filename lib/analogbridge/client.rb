require "rest-client"
require "analogbridge/configuration"
require "analogbridge/response"

module Analogbridge
  class Client
    attr_reader :http_method, :end_point, :attributes

    def initialize(http_method, end_point, attributes = {})
      @end_point = end_point
      @http_method = http_method
      @attributes = attributes
    end

    def execute
      Response.new(execute_api_request).parse
    end

    private

    def execute_api_request
      RestClient::Request.execute(
        method: http_method,
        url: api_end_point,
        payload: attributes,
        headers: {},
      )
    end

    def api_end_point
      [Analogbridge.configuration.api_host, end_point].join("/")
    end
  end

  def self.get_resource(end_point)
    Client.new(:get, end_point).execute
  end
end
