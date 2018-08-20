class squid::params {



  $config_dir = '/etc/squid'

  case $::osfamily
  {
    'redhat':
    {
      $package_name = 'squid'
      $service_name = 'squid'

      $config_file = '/etc/squid/squid.conf'
      $squid_username = 'squid'

      case $::operatingsystemrelease
      {
        /^6.*$/:
        {
          $coredump_dir_default='/var/spool/squid'
          $builtin_acls = false
          $client_package_name = undef
        }
        /^7.*$/:
        {
          $coredump_dir_default='/var/spool/squid'
          $builtin_acls = true
          $client_package_name = undef
        }
        default: { fail("Unsupported RHEL/CentOS version! - ${::operatingsystemrelease}")  }
      }
    }
    'Debian':
    {
      $squid_username = 'proxy'

      case $::operatingsystem
      {
        'Ubuntu':
        {
          case $::operatingsystemrelease
          {
            /^14.*$/:
            {
              $package_name = 'squid3'
              $service_name = 'squid3'

              $config_file = '/etc/squid3/squid.conf'

              $coredump_dir_default='/var/spool/squid'
              $builtin_acls = true
              $client_package_name = 'squidclient'
            }
            /^16.*$/:
            {
              $package_name = 'squid'
              $service_name = 'squid'

              $config_file = '/etc/squid/squid.conf'

              $coredump_dir_default='/var/spool/squid'
              $builtin_acls = true
              $client_package_name = 'squidclient'
            }
            default: { fail("Unsupported Ubuntu version! - ${::operatingsystemrelease}")  }
          }
        }
        'Debian': { fail('Unsupported')  }
        default: { fail('Unsupported Debian flavour!')  }
      }
    }
    default: { fail('Unsupported OS!')  }
  }
}
