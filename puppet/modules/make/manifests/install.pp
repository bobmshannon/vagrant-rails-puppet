# == Class make::intall
#
class make::install {
  include make::params

  package { $make::params::package_name:
    ensure => present,
  }
}
