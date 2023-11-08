require 'chefspec'

RSpec.configure do |config|
  config.default_path = 'spec'
  config.color = true
  config.formatter = :documentation
end
