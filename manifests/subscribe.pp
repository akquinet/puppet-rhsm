# = Define: rhsm::subscribe
#
# This define subscribes a rhel6+ machine to the certificate-based redhat subscription management 
#
# == Parameters
# [*pool*]
# the poolId of your subscription
# 
# == Examples
# TODO
#
define rhsm::subscribe ($pool) {
  include rhsm
  
  exec {"subscribe_to_$pool":
    command => "subscription-manager subscribe --pool=$pool",
    cwd => '/tmp',
    path => ["/bin", "/sbin", "/usr/bin"],
  }
}