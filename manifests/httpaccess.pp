# http_access allow RHEL-UpdateServers
# http_access allow|deny [!]aclname ..
define squid::httpaccess(
                          $acls           = [ $name ],
                          $action         = 'allow',
                          $description    = undef,
                          $order          = '0',
                        ) {
  concat::fragment{ "${squid::params::config_file} httpaccess ${name}":
    target  => $squid::params::config_file,
    order   => "40${order}",
    content => template("${module_name}/http_access.erb"),
  }
}
