# == Class: squid
#
# === squid::config documentation
#
class squid::config inherits squid {

  concat { $squid::params::config_file:
    ensure => 'present',
    owner  => 'root',
    group  => $squid::params::squid_username,
    mode   => '0640',
  }

  concat::fragment{ "${squid::params::config_file} header":
    target  => $squid::params::config_file,
    order   => '00',
    content => template("${module_name}/squidconf_header.erb"),
  }

  concat::fragment{ "${squid::params::config_file} tail":
    target  => $squid::params::config_file,
    order   => '99',
    content => template("${module_name}/squidconf_tail.erb"),
  }

}
