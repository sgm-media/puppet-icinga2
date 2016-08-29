# == Class: icinga2::feature::influxdb
#
# Manage and enable opentsdb of Icinga2
#
class icinga2::feature::influxdb (
  $host     = '127.0.0.1',
  $port     = 8086,
  $database = 'icinga2',
) {

  ::icinga2::object::influxdbwriter { 'influxdb':
    host     => $host,
    port     => $port,
    database => $database,
  }
  ::icinga2::feature { 'influxdb':
    manage_file => false,
  }
}
