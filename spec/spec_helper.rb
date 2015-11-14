require 'rspec'
require 'rspec/collection_matchers'
require 'rspec/its'

RSpec.configure do |config|
  config.disable_monkey_patching!
  config.warnings = true

  config.default_formatter = 'doc' if config.files_to_run.one?

  config.order = :random
  Kernel.srand config.seed
end
