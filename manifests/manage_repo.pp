define rhsm::manage_repo (
  $id,
  $name,
  $baseurl,
  $enabled = '1',
  $gpgcheck ='1',
  $gpgkey = '',
  $sslverify ='1',
  $sslcacert = '/etc/rhsm/ca/redhat-uep.pem',
  $sslclientkey = '',
  $sslclientcert = '',
  $metadata_expire = '86400',
) {
  file { "/etc/yum.repos.d/$id.repo" :
    content => template('rhsm/redhat-single.repo.erb'),
  }
  
}