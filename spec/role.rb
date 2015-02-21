# encoding: utf-8

case os[:family]
when %r(debian|ubuntu)
  execute 'apt-get update -y'
end

include_recipe 'rtn_git::system'

