# == Class: icinga2::server::config
#
# This class configures the server components for the Icinga 2 monitoring system.
#
# === Parameters
#
# Coming soon...
#
# === Examples
# 
# Coming soon...
# 

class icinga2::server::config inherits icinga2::server {
  
  include icinga2::params
  
  #Directory resource for /etc/icinga2/:
  file { '/etc/icinga2/':
    path    => '/etc/icinga2/',
    ensure  => directory,
    owner   => $etc_icinga2_owner,
    group   => $etc_icinga2_group,
    mode    => $etc_icinga2_mode,
    #require => Package[$icinga2::params::icinga2_server_packages],
  }

  #File resource for /etc/icinga2/icinga2.conf:
  file { '/etc/icinga2/icinga2.conf':
    path    => '/etc/icinga2/icinga2.conf',
    ensure  => file,
    owner   => $etc_icinga2_icinga2_conf_owner,
    group   => $etc_icinga2_icinga2_conf_group,
    mode    => $etc_icinga2_icinga2_conf_mode,
    content => template('icinga2/icinga2.conf.erb'),
  }

  #Directory resource for /etc/icinga2/conf.d/:
  file { '/etc/icinga2/conf.d/':
    path    => '/etc/icinga2/conf.d/',
    ensure  => directory,
    owner   => $etc_icinga2_confd_owner,
    group   => $etc_icinga2_confd_group,
    mode    => $etc_icinga2_confd_mode,
  }

  #Directory resource for /etc/icinga2/features-available/:
  file { '/etc/icinga2/features-available/':
    path    => '/etc/icinga2/features-available/',
    ensure  => directory,
    owner   => $etc_icinga2_features_available_owner,
    group   => $etc_icinga2_features_available_group,
    mode    => $etc_icinga2_features_available_mode,
  }

  #Directory resource for /etc/icinga2/features-enabled/:
  file { '/etc/icinga2/features-enabled/':
    path    => '/etc/icinga2/features-enabled/',
    ensure  => directory,
    owner   => $etc_icinga2_features_enabled_owner,
    group   => $etc_icinga2_features_enabled_group,
    mode    => $etc_icinga2_features_enabled_mode,
  }
  
  #Directory resource for /etc/icinga2/pki/:
  file { '/etc/icinga2/pki/':
    path    => '/etc/icinga2/pki/',
    ensure  => directory,
    owner   => $etc_icinga2_pki_owner,
    group   => $etc_icinga2_pki_group,
    mode    => $etc_icinga2_pki_mode,
  }

}