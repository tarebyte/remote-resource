require_relative 'attribute_lookup'

module ApiCachedAttributes
  # Our humble storage
  module LookupMethodRegistration
    def self.extended(klass)
      klass.instance_variable_set(:@lookup_method, nil)
    end

    def lookup_method=(lookup_method)
      @lookup_method = lookup_method
    end

    def lookup_method
      @lookup_method || default_lookup_method
    end

    def default_lookup_method
      AttributeLookup.new
    end
  end
end