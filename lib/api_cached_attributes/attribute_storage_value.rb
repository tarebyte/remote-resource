require_relative './attribute_http_client'
require 'active_support/core_ext/module/delegation'

module ApiCachedAttributes
  class AttributeStorageValue
    delegate :exists?, :headers_for_validation, :validate, :validateable?,
             to: :@storage_entry, allow_nil: true

    def initialize(attribute)
      @attribute = attribute
      @storage_entry = nil
    end

    def value
      storage_entry.data[@attribute.name]
    end

    def storages
      ApiCachedAttributes.storages
    end

    def write(storage_entry)
      @storage_entry = nil
      storages.each do |storage|
        storage.write_key(@attribute.key.for_storage, storage_entry)
      end
    end

    def storage_entry
      return @storage_entry if @storage_entry
      storages.each do |storage|
        if storage_entry = storage.read_key(@attribute.key.for_storage)
          @storage_entry = storage_entry
          return @storage_entry
        end
      end
    end
  end
end
