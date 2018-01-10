require 'dolla'
require 'minitest/unit'
require 'minitest/autorun'
require 'minitest/pride'
require 'active_support'
require 'factory_girl'

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
end

FactoryGirl.definition_file_paths << File.join(File.dirname(__FILE__), 'factories')
FactoryGirl.find_definitions
