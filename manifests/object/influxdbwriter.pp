# == Defined type: icinga2::object::influxdbwriter
#
#  This is a defined type for Icinga 2 InfluxdbWriter objects.
# See the following Icinga 2 doc page for more info:
# http://docs.icinga.org/icinga2/latest/doc/module/icinga2/chapter/object-types#objecttype-influxdbwriter
#
# === Parameters
#
# See the inline comments.
#

define icinga2::object::influxdbwriter (
  $host       = '127.0.0.1',
  $port       = 8086,
  $database   = 'icinga2',
  # Put the object files this defined type generates in features-available
  # since the Graphite writer feature is one that has to be explicitly enabled.
  $target_dir = '/etc/icinga2/features-available',
  $file_name  = "${name}.conf",
) {
  # Do some validation
  validate_string($host)
  validate_string($database)

  file { "${target_dir}/${file_name}":
    ensure  => file,
    owner   => $::icinga2::config_owner,
    group   => $::icinga2::config_group,
    mode    => $::icinga2::config_mode,
    content => template('icinga2/object/influxdbwriter.conf.erb'),
  }
  if $::icinga2::manage_service {
    File["${target_dir}/${file_name}"] ~> Class['::icinga2::service']
  }
}
