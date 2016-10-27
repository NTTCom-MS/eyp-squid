# == Class: squid
#
# === squid documentation
#
class squid (
              $port                          = '0.0.0.0:3128',
              $disable_cache                 = true,
              $httpd_suppress_version_string = true,
              $add_via_header                = false,
              $add_forwarded_for_header      = false,
              $strip_query_terms             = true,
              $coredump_dir                  = '/var/spool/squid',
              $localnet                      = [ '10.0.0.0/8', '172.16.0.0/12', '192.168.0.0/16', 'fc00::/7', 'fe80::/10' ],
              $ssl_ports                     = [ '443' ],
              $safe_ports                    = [ '80', '21', '443' ],
              $unsafeports_action            = 'deny',
              $localnet_action               = 'allow',
              $localhost_action              = 'allow',
              $default_action                = 'deny',
              $manage_package                = true,
              $package_ensure                = 'installed',
              $manage_service                = true,
              $manage_docker_service         = true,
              $service_ensure                = 'running',
              $service_enable                = true,
            ) inherits squid::params{

  class { '::squid::install': } ->
  class { '::squid::config': } ~>
  class { '::squid::service': } ->
  Class['::squid']

}
