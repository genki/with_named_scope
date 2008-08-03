require 'rubygems'
require 'active_record'
require 'active_record/named_scope'

class WithNamedScope
  VERSION = '0.0.6'
end

module ActiveRecord
  class Base
    named_scope :identity
  end

  module NamedScope
    class Scope
      undef :with_scope

    private
      def method_missing(method, *args, &block)
        if scopes.include?(method)
          scopes[method].call(self, *args)
        else
          proxy_scope.send(:with_scope,
            :find => proxy_options,
            :create => proxy_options[:conditions].is_a?(Hash) ?
              proxy_options[:conditions] : {}
          ) do
            method = :new if method == :build
            proxy_scope.send(method, *args, &block)
          end
        end
      end
    end
  end
end
