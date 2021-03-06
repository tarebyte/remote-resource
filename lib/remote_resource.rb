require 'remote_resource/errors'
require 'remote_resource/configuration/logger'
require 'remote_resource/configuration/lookup_method'
require 'remote_resource/configuration/storage'
require 'remote_resource/version'
require 'remote_resource/railtie' if defined?(::Rails)

require 'active_support/core_ext/string'
require 'active_support/descendants_tracker'
require 'active_support/dependencies/autoload'

# doc
module RemoteResource
  extend ActiveSupport::Autoload

  extend Configuration::Logger
  extend Configuration::Storage
  extend Configuration::LookupMethod

  autoload_under 'base' do
    autoload :Attributes
    autoload :Dsl
    autoload :BaseClassMethods
    autoload :Rescue
  end

  autoload :AssociationBuilder
  autoload :AttributeMethodAttacher
  autoload :AttributeSpecification
  autoload :Base
  autoload :Bridge
  autoload :LogSubscriber
  autoload :ScopeEvaluator
end
