module ActiveRecord
  class Base
    class << self
    protected
      def with(&block)
        block.call if block
      end
    end
  end

  module NamedScope
    class Scope
      def with(&block)
        create = proxy_options[:conditions].is_a?(Hash) ?
          proxy_options[:conditions] : {}
        with_scope :find => proxy_options, :create => create do
          proxy_scope.with(&block)
        end
      end
    end
  end
end
