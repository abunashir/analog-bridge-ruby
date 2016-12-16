module FakeAnalogbridgeApi
  def stub_analogbridge_product_listing
    stub_api_response(
      :get,
      "products",
      filename: "products",
      status: 200,
    )
  end

  private

  def stub_api_response(method, end_point, filename:, status:, data: nil)
    stub_request(method, api_end_point(end_point)).
      with(api_request_headers(data: data)).
      to_return(response_with(filename: filename, status: status))
  end

  def api_end_point(end_point)
    [Analogbridge.configuration.api_host, end_point].join("/")
  end

  def api_request_headers(data:)
    Hash.new.tap do |request_headers|
      request_headers[:body] = data
    end
  end

  def api_authorization_headers
    {}
  end

  def response_with(filename:, status:)
    { body: fixture_file(filename), status: status }
  end

  def fixture_file(filename)
    file_name = [filename, "json"].join(".")
    file_path = ["../../", "fixtures", file_name].join("/")

    File.read(File.expand_path(file_path, __FILE__))
  end
end
