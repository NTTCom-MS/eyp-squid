# == Class: squid
#
# === squid::install documentation
#
class squid::install inherits squid {

  if($squid::manage_package)
  {
    # package here, for example:
    package { $squid::params::package_name:
      ensure => $squid::package_ensure,
    }

    if($squid::install_client)
    {
      if($squid::params::client_package_name!=undef)
      {
        package { $squid::params::client_package_name:
          ensure => $squid::package_ensure,
        }
      }
    }
  }

}
