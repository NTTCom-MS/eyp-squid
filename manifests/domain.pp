define squid::domain(
                      $domainname = $name,
                      $action     = 'deny',
                      $order      = undef,
                    ) {
  validate_re($action, [ '^allow$', '^deny$' ], 'valid actions: allow/deny')

  if($order==undef)
  {
    case $action
    {
      'allow':
      {
        $fragment_order='50'
      }
      'deny':
      {
        $fragment_order='60'
      }
      default:
      {
        fail('invalid action')
      }
    }
  }
  else
  {
      $fragment_order=$order
  }

  if(!defined(Concat["${squid::config_dir}/squid.${action}.acl"]))
  {
    concat { "${squid::config_dir}/squid.${action}.acl":
      ensure => 'present',
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      notify => Class['::squid::service'],
    }

    concat::fragment{ "${squid::params::config_file} ${action} ${fragment_order}":
      target  => $squid::params::config_file,
      order   => $fragment_order,
      content => template("${module_name}/domain.allowaction.erb"),
    }
  }

  concat::fragment{ "${squid::config_dir}/squid.${action}.acl ${domainname}":
    target  => "${squid::config_dir}/squid.${action}.acl",
    order   => '42',
    content => "${domainname}\n",
  }


}
