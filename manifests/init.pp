# == Class: squid
#
# === squid documentation
#
class squid(
                            $manage_package        = true,
                            $package_ensure        = 'installed',
                            $manage_service        = true,
                            $manage_docker_service = true,
                            $service_ensure        = 'running',
                            $service_enable        = true,
                          ) inherits squid::params{

  class { '::squid::install': } ->
  class { '::squid::config': } ~>
  class { '::squid::service': } ->
  Class['::squid']

}
