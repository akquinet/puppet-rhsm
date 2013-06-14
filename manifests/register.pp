# = Define: rhsm::register
#
# This define registers a rhel6+ machine to an your rhsm account 
#
# == Parameters
# [*username*][*password*]
# your redhat account data
# 
# [*force*]
# default = true
# 
# == Examples
# TODO
#
define rhsm::register ($username, $password, $force=true, $autosubscribe=false) {
  include rhsm
  
  $forcevalue = $force ? {
    true => ' --force',
    default => '',
  }
  $autosubvalue = $autosubscribe ? {
    true => ' --autosubscribe',
    default => '',
  }
  exec {"register_in_account_$username":
    command => "subscription-manager register$forcevalue$autosubvalue --username=$username --password=$password",
    cwd => '/tmp',
    path => ["/bin", "/sbin", "/usr/bin"],
  }
}