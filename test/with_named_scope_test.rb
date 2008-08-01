require File.dirname(__FILE__) + '/test_helper.rb'

require "test/unit"
class WithNamedScopeTest < Test::Unit::TestCase
  class ::User < ActiveRecord::Base
    named_scope :active, :conditions => {:active => true}
  end

  def setup
    ActiveRecord::Base.establish_connection(
      :adapter  => "sqlite3",
      :host     => "localhost",
      :database => File.dirname(__FILE__) + "/test.sqlite3",
      :timeout  => 5000
    )
    ActiveRecord::Migration.verbose = false
    ActiveRecord::Schema.define(:version => 1) do
      create_table "users", :force => true do |t|
        t.string  :name
        t.boolean :active
      end
    end unless User.table_exists?
    User.create! :name => 'foo', :active => true
    User.create! :name => 'bar', :active => false
  end

  def teardown
    ActiveRecord::Schema.define(:version => 2) do
      drop_table 'users'
    end if User.table_exists?
  end

  def test_database
    assert_equal 2, User.count
  end

  def test_with_active_scope
    assert_equal 1, User.active.count
    User.active.with_scope do
      assert_equal 1, User.count
    end
  end

  def test_with_identity_scope
    assert_equal 2, User.identity.count
    User.identity.with_scope do
      assert_equal 2, User.count
    end
  end
end
