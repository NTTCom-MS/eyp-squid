# follow_x_forwarded_for allow localhost
# puppet2sitepp @squidfollowxffs
define squid::followxff (
                          $action      = 'allow',
                          $acls        = [],
                          $order       = '00',
                          $description = undef,
                        ) {
  concat::fragment{ "${squid::params::config_file} follow xff ${name}":
    target  => $squid::params::config_file,
    order   => "40${order}",
    content => template("${module_name}/followxff.erb"),
  }
}
