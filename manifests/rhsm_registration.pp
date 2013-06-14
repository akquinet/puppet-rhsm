class rhsm_registration(
  $registration_username, 
  $registration_password, 
  $registration_autosubscribe = false, 
  $registration_force = true) {
  rhsm::register { "rhsm_registraton":
    username => $registration_username,
    password => $registration_password,
    autosubscribe => $registration_autosubscribe,
    force => $registration_force,    
  }
}