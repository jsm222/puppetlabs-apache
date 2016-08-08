class apache::package (
  $ensure     = 'present',
  $mpm_module = $::apache::params::mpm_module,
) inherits ::apache::params {

  # The base class must be included first because it is used by parameter defaults
  if ! defined(Class['apache']) {
    fail('You must include the apache base class before using any apache defined resources')
  }
  package { 'httpd':
    ensure => $ensure,
    name   => $::apache::apache_name,
    notify => Class['Apache::Service'],
  }
}
