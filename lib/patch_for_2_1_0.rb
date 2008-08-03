# see http://rails.lighthouseapp.com/attachments/28697
module ActiveRecord
  class Base
    class << self
    private
      def construct_finder_sql(options)
        scope = scope(:find)
        #sql  = "SELECT #{options[:select] || (scope && scope[:select]) || ((options[:joins] || (scope && scope[:joins])) && quoted_table_name + '.*') || '*'} "
        sql  = "SELECT #{options[:select] || (scope && scope[:select]) || ((options[:joins] || (scope && scope[:joins])) && quoted_table_name + '.*') || '*'} "

        sql << "FROM #{(scope && scope[:from]) || options[:from] || quoted_table_name} "

        add_joins!(sql, options, scope)
        add_conditions!(sql, options[:conditions], scope)

        add_group!(sql, options[:group], scope)
        add_order!(sql, options[:order], scope)
        add_limit!(sql, options, scope)
        add_lock!(sql, options, scope)

        sql
      end
    end
  end
end
