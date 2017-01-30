#
# acl MS-WindowsActivation dstdom_regex (^|\.)go.microsoft.com$
# acl RHEL-UpdateServers dst subscription.rhn.redhat.com
# acl HOST-systemadmin.es src 1.2.3.4
#
define squid::acl (
                    $type,
                    $values,
                    $aclname     = $name,
                    $order       = '0',
                    $description = undef,
                  ) {
  # concat 30
  concat::fragment{ "${squid::params::config_file} ACL ${aclname}/${name}":
    target  => $squid::params::config_file,
    order   => "30${order}",
    content => template("${module_name}/acl.erb"),
  }
}
