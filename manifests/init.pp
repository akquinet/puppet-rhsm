# Class: rhsm
#
# This module lets you manage your subscriptions and redhat repos via puppet. 
# It provides several definitions which can be executed standalone, but then mutually exclusive or all together by 
# including the rhsm class in resource-like declartion syntax. 
# This class uses a staging model, so that you might be able to easily add your own classes, e.g. a second class 
# to activate a second subscription. Be aware that puppet stages are usually just used to ensure that all required 
# package repos are activated before actual package installations in the default "main"-stage can take place.  
# Because Red Hat repositories require some prerequisites like registration and subscription activation this module
# comes along with more than a repo_activation stage. 
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class rhsm(
  $registration_username, 
  $registration_password, 
  $registration_autosubscribe = false, 
  $registration_force = true,   
  $unsubscribe_from='all',
  $subscribe_to_pool=undef,  
) inherits rhsm_stages {
  class { "rhsm_registration_req":       
    stage => 'rhsm_registration_req' 
  }
  class { "rhsm_registration":
	  registration_username => $registration_username, 
	  registration_password => $registration_password, 
	  registration_autosubscribe => $registration_autosubscribe, 
	  registration_force => $registration_force,      
    stage => 'rhsm_registration' 
  }
  class { "rhsm_remove_previous":
    unsubscribe_from => $unsubscribe_from,
    stage => 'rhsm_remove_previous'  
  }
  
  class {"rhsm_subscription_activation":
    subscribe_to_pool => $subscribe_to_pool,
    stage => 'rhsm_subscription_activation',
  } 
  class {"rhsm_repo_activation":    
    stage => 'rhsm_repo_activation',
  }
}

import 'manage_repo.pp'   
    