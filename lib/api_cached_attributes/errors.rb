require 'active_support/core_ext/string/strip'

module ApiCachedAttributes
  class Error < StandardError; end

  class ScopeNotSet < Error
    def initialize(attribute_name)
      @attribute_name = attribute_name
    end

    def message
      msg = <<-MESSAGE.strip_heredoc
        Undefined scope for attribute `#{@attribute_name}`. The scope is a
        required part of an attribute in order to uniquely identify it. Use
        `client_scope=` to set the scope.
      MESSAGE
    end
  end

  class ApiReadOnlyMethod < Error
    def initialize(method_name)
      @method_name = method_name
    end

    def message
      msg = <<-MESSAGE.strip_heredoc

        The `ApiCachedAttributes` gem creates read only methods which represent
        API values. `#{@method_name}` was defined using this gem and this error
        is raised to indicate that these attributes are read only, although you
        may override this behavior by defining a `#{@method_name}=` setter
        method on this class.
      MESSAGE
    end
  end
end
