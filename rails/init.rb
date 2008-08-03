require 'with_named_scope'

if Rails::version == '2.1.0'
  require 'patch_for_2_1_0'
end
