# == Class: make
#
# Install the make package
#
class make (
) inherits make::params {

  # validate parameters here

  class { 'make::install': } ->
  Class['make']
}
