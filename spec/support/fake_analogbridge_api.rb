module FakeAnalogbridgeApi
  def stub_analogbridge_customer_create(attributes)
    stub_api_response(
      :post,
      "customers",
      data: attributes,
      filename: "customer_created",
      status: 200,
    )
  end

  def stub_analogbridge_customer_find(customer_id)
    stub_api_response(
      :get,
      ["customers", customer_id].join("/"),
      filename: "customer",
      status: 200,
    )
  end

  def stub_analogbridge_customer_update(customer_id, attributes)
    stub_api_response(
      :post,
      ["customers", customer_id].join("/"),
      data: attributes,
      filename: "customer_created",
      status: 200,
    )
  end

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
    [AnalogBridge.configuration.api_host, end_point].join("/")
  end

  def api_request_headers(data:)
    Hash.new.tap do |request_headers|
      request_headers[:body] = data
      request_headers[:headers] = api_authorization_headers
    end
  end

  def api_authorization_headers
    { "Authorization" => "Basic U0VDUkVUX0FQSV9LRVk6" }
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
