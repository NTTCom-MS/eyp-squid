# http://www.squid-cache.org/Doc/config/access_log/
define squid::accesslog (
                          $path      = $name,
                          $module    = 'daemon',
                          $logformat = 'squid',
                          $none      = false,
                        ) {

  # access_log <module>:<place> [option ...] [acl acl ...]
  # access_log daemon:/usr/local/squid/var/logs/access.log squid
  concat::fragment{ "${squid::params::config_file} accesslog ${path}":
    target  => $squid::params::config_file,
    order   => '80',
    content => template("${module_name}/accesslog.erb"),
  }

}
