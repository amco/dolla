require 'rails'

module Dolla
  class Railtie < Rails::Railtie
    railtie_name :dolla

    rake_tasks do
      load File.join File.dirname(__FILE__), 'tasks/prefixes.rake'
    end
  end
end


