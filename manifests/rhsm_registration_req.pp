class rhsm_registration_req inherits rhsm_stages {
  package { "subscription-manager":
    ensure => present,
  }  
}