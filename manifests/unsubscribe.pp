# = Define: rhsm::unsubscribe
#
# This define subscribes a rhel6+ machine to the certificate-based redhat subscription management 
#
# == Parameters
# [*from*]
# default = 'all', otherwise 
# 
# == Examples
# TODO
#
define rhsm::unsubscribe ($from='all') {
  include rhsm
  
  $selection = $from ? {    
    'all' => '--all',
    default => '--serial=$from',
  } 
  
  exec {"unsubscribe_from_$from":
    command => "subscription-manager unsubscribe $selection",
    cwd => '/tmp',
    path => ["/bin", "/sbin", "/usr/bin"],
  }
}