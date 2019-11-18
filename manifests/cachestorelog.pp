# http://www.squid-cache.org/Doc/config/cache_store_log/
define squid::cachestorelog (
                              $path      = $name,
                              $module    = 'daemon',
                              $logformat = 'squid',
                              $none      = false,
                            ) {
  concat::fragment{ "${squid::params::config_file} cachestorelog ${path}":
    target  => $squid::params::config_file,
    order   => '80',
    content => template("${module_name}/cachestorelog.erb"),
  }

}
