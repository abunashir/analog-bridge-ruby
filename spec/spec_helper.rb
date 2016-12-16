require "webmock/rspec"
$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "analogbridge"

Dir["./spec/support/**/*.rb"].sort.each { |file| require file }

RSpec.configure do |config|
  config.before :suite do
    config.include FakeAnalogbridgeApi
  end
end
