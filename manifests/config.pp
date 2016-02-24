# == Class: carbon_relay_ng::config
#
# Full description of class carbon_relay_ng here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'carbon_relay_ng':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class carbon_relay_ng::config {

  file { $carbon_relay_ng::config_dir:
    ensure => directory,
    mode   => '0755',
    owner  => $carbon_relay_ng::configfile_owner,
    group  => $carbon_relay_ng::configfile_group
  } ->
  file { "$carbon_relay_ng::config_dir/$carbon_relay_ng::configfile":
    content => template('carbon_relay_ng/carbon-relay-ng.ini.erb'),
    mode    => '0644',
    owner   => $carbon_relay_ng::configfile_owner,
    group   => $carbon_relay_ng::configfile_group
  }
}
