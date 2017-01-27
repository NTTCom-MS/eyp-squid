# http://www.squid-cache.org/Doc/config/logformat/
define squid::logformat (
                          $format,
                          $logname = $name,
                        ) {
  concat::fragment{ "${squid::params::config_file} logformat ${logname}":
    target  => $squid::params::config_file,
    order   => '79',
    content => template("${module_name}/logformat.erb"),
  }
}
