class rhsm_repo_activation {
  ## TODO: determine serial number through facter or sth similar
  ## this is an ugly workaround
  $serial_number='fixnr'
  $key_dir='/etc/pki/entitlement'
  exec { "create_workaround_link_to_nr_key_pem":
    command => "ln -fs $(ls $key_dir/ | grep .*-key.pem) $key_dir/${serial_number}-key.pem",
    cwd => '/tmp',
    path => ["/bin", "/sbin", "/usr/bin"],   
  }
  exec { "create_workaround_link_to_nr_pem":
    command => "ln -fs $(ls $key_dir/ | grep .*[0123456789].pem) $key_dir/${serial_number}.pem",
    cwd => '/tmp',
    path => ["/bin", "/sbin", "/usr/bin"],
  }
}