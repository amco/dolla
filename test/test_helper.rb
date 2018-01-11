require 'dolla'
require 'minitest'
require 'minitest/unit'
require 'minitest/autorun'
require 'minitest/pride'
require 'active_support'
require 'factory_bot'
require 'rails'

require 'active_record'
require 'symbolize/active_record'

puts "Using ActiveRecord #{ActiveRecord::VERSION::STRING}"

ActiveRecord::Base.send :include, Symbolize::ActiveRecord

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
end

FactoryBot.definition_file_paths << File.join(File.dirname(__FILE__), 'factories')
FactoryBot.find_definitions
