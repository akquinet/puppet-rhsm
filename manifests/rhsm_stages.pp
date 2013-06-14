class rhsm_stages {
  stage { 'rhsm_registration_req': 
    before => Stage['rhsm_registration'], }

  stage { 'rhsm_registration':
    before => Stage['rhsm_remove_previous'],
  }

  stage { 'rhsm_remove_previous':
    before => Stage['rhsm_subscription_activation'],
  }

  stage { 'rhsm_subscription_activation':
    before => Stage['rhsm_repo_activation'],
  }

  stage { 'rhsm_repo_activation':
    before => Stage['main'],
  }

}