class rhsm_subscription_activation($subscribe_to_pool) {
  rhsm::subscribe { "activate_defined_subscription":
    pool => $subscribe_to_pool,    
  } 
}