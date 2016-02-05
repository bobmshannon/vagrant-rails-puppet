# == Class make::params
#
# This class is meant to be called from make
# It sets variables according to platform
#
class make::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'make'
    }
    'RedHat', 'Amazon': {
      $package_name = 'make'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
