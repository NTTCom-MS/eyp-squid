# squid

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What squid affects](#what-squid-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with squid](#beginning-with-squid)
4. [Usage](#usage)
5. [Reference](#reference)
5. [Limitations](#limitations)
6. [Development](#development)
    * [TODO](#todo)
    * [Contributing](#contributing)

## Overview

squid management

## Module Description

This module setups and configures squid. It has limited ACL support

## Setup

### What squid affects

* squid package management
* squid configuration management
* logrotation configurtion (only if eyp-logrotate is available)

### Setup Requirements

This module requires pluginsync enabled

### Beginning with squid

```puppet
class { 'squid':
		visible_hostname => 'example',
		disable_cache => true,
	}
```

## Usage

### accesslog/logformat

```puppet
squid::logformat { 'squid-demo':
  format => 'timestamp="%{%Y-%m-%dT%H:%M:%S%z}tg" vendor="Squid" src=%>a url="%>ru" src_ip=%">a status=%<Hs http_user_agent="%{User-Agent}>h" http_method=%>rm http_content_type=%mt http_content_type_raw="%{Content-Type}<h" bytes_in=%<st bytes_out=%>st user=%un http_referer="%{Referer}>h" uri_path="%rp" url_port=%<p uri_scheme=%>rs duration=%<tt dest_port=%<p src_port=%>p dest_ip=%<a proxy_ip=%<la proxy_dest_port=%>lp proxy_src_port=%<lp dest_host=%{Host}>h',
}

squid::accesslog { '/var/log/squid/access.log':
  logformat => 'squid-demo',
}
```

### allow/deny domains

```puppet
squid::domain { '.systemadmin.es':
  action => 'allow',
}

squid::domain { '.facebook.com':
  action => 'deny',
}

squid::domain { '.meneame.net':
  action => 'deny',
}

squid::domain { '.twitter.com':
  action => 'deny',
}
```

### acl management

```puppet
squid::acl { 'RHEL-UpdateServers':
  type => 'dst',
  values => [ 'subscription.rhn.redhat.com', 'subscription.rhsm.redhat.com' ],
}
```

this generates the following ACLs:

```
acl RHEL-UpdateServers dst subscription.rhn.redhat.com
acl RHEL-UpdateServers dst subscription.rhsm.redhat.com
```

### http_access management

```puppet
squid::httpaccess { 'RHEL-UpdateServers':
}
```

```
http_access allow RHEL-UpdateServers
```

### squidclient example
```
# squidclient -h 127.0.0.1 -p 3128 mgr:info
HTTP/1.1 200 OK
Server: squid
Mime-Version: 1.0
Date: Wed, 30 Nov 2016 16:07:26 GMT
Content-Type: text/plain
Expires: Wed, 30 Nov 2016 16:07:26 GMT
Last-Modified: Wed, 30 Nov 2016 16:07:26 GMT
X-Cache: MISS from =
X-Cache-Lookup: MISS from =:3128
Connection: close

Squid Object Cache: Version 3.3.8
Start Time:	Wed, 30 Nov 2016 16:06:53 GMT
Current Time:	Wed, 30 Nov 2016 16:07:26 GMT
Connection information for squid:
	Number of clients accessing cache:	1
	Number of HTTP requests received:	0
	Number of ICP messages received:	0
	Number of ICP messages sent:	0
	Number of queued ICP replies:	0
	Number of HTCP messages received:	0
	Number of HTCP messages sent:	0
	Request failure ratio:	 0.00
	Average HTTP requests per minute since start:	0.0
	Average ICP messages per minute since start:	0.0
	Select loop called: 4562 times, 7.216 ms avg
Cache information for squid:
	Hits as % of all requests:	5min: 0.0%, 60min: 0.0%
	Hits as % of bytes sent:	5min: -0.0%, 60min: -0.0%
	Memory hits as % of hit requests:	5min: 0.0%, 60min: 0.0%
	Disk hits as % of hit requests:	5min: 0.0%, 60min: 0.0%
	Storage Swap size:	0 KB
	Storage Swap capacity:	 0.0% used,  0.0% free
	Storage Mem size:	216 KB
	Storage Mem capacity:	 0.1% used, 99.9% free
	Mean Object Size:	0.00 KB
	Requests given to unlinkd:	0
Median Service Times (seconds)  5 min    60 min:
	HTTP Requests (All):   0.00000  0.00000
	Cache Misses:          0.00000  0.00000
	Cache Hits:            0.00000  0.00000
	Near Hits:             0.00000  0.00000
	Not-Modified Replies:  0.00000  0.00000
	DNS Lookups:           0.00000  0.00000
	ICP Queries:           0.00000  0.00000
Resource usage for squid:
	UP Time:	32.919 seconds
	CPU Time:	0.125 seconds
	CPU Usage:	0.38%
	CPU Usage, 5 minute avg:	0.00%
	CPU Usage, 60 minute avg:	0.00%
	Process Data Segment Size via sbrk(): 5708 KB
	Maximum Resident Size: 62496 KB
	Page faults with physical i/o: 0
Memory usage for squid via mallinfo():
	Total space in arena:    5840 KB
	Ordinary blocks:         5764 KB      4 blks
	Small blocks:               0 KB      0 blks
	Holding blocks:          9940 KB      6 blks
	Free Small blocks:          0 KB
	Free Ordinary blocks:      76 KB
	Total in use:              76 KB 0%
	Total free:                76 KB 0%
	Total size:             15780 KB
Memory accounted for:
	Total accounted:          359 KB   2%
	memPool accounted:        359 KB   2%
	memPool unaccounted:    15421 KB  98%
	memPoolAlloc calls:      1555
	memPoolFree calls:       1565
File descriptor usage for squid:
	Maximum number of file descriptors:   16384
	Largest file desc currently in use:     11
	Number of file desc currently in use:    6
	Files queued for open:                   0
	Available number of file descriptors: 16378
	Reserved number of file descriptors:   100
	Store Disk files open:                   0
Internal Data Structures:
	    52 StoreEntries
	    52 StoreEntries with MemObjects
	    51 Hot Object Cache Items
	     0 on-disk objects
```

## Reference

### classes

#### squid

* **port**:                          = '0.0.0.0:3128',
* **disable_cache**:                 = true,
* **httpd_suppress_version_string**: = true,
* **add_via_header**:                = false,
* **add_forwarded_for_header**:      = false,
* **strip_query_terms**:             = true,
* **coredump_dir**:                  = $squid::params::coredump_dir_default,
* **localnet**:                      = [ '10.0.0.0/8', '172.16.0.0/12', '192.168.0.0/16', 'fc00::/7', 'fe80::/10' ],
* **ssl_ports**:                     = [ '443' ],
* **safe_ports**:                    = [ '80', '21', '443', '3128' ],
* **unsafeports_action**:            = 'deny',
* **localnet_action**:               = 'allow',
* **localhost_action**:              = 'allow',
* **default_action**:                = 'deny',
* **manage_package**:                = true,
* **package_ensure**:                = 'installed',
* **manage_service**:                = true,
* **manage_docker_service**:         = true,
* **service_ensure**:                = 'running',
* **service_enable**:                = true,
* **manager_allow**:                 = [ 'localhost' ],
* **manager_default_rule**:          = 'deny',
* **install_client**:                = true,
* **visible_hostname**:              = undef,
* **configure_logrotate**:           = true,
* **logrotate_rotate**:              = '4',
* **logrotate_compress**:            = true,
* **logrotate_missingok**:           = true,
* **logrotate_notifempty**:          = true,
* **logrotate_frequency**:           = 'weekly',
* **cache_dir**:                     = '/var/spool/squid',
* **cache_format**:                  = 'ufs',
* **cache_l1**:                      = '16',
* **cache_l2**:                      = '256',
* **cache_size_mb**:                 = '100',

### defines

#### accesslog

* **path**:      = $name,
* **module**:    = 'daemon',
* **logformat**: = 'squid',

#### domain

* **domainname**: = $name,
* **action**:     = 'deny',
* **order**:      = undef,

#### logformat

* **format**:,
* **logname**: = $name,

#### httpaccess

* **acls**: [ $name ]
* **action**: 'allow'
* **description**: undef
* **order**: '0'

#### acl

* **type**:
* **values**:
* **aclname**:     = $name,
* **order**:       = '0',
* **description**: = undef,

## Limitations

Manually validated on CentOS 7

## Development

We are pushing to have acceptance testing in place, so any new feature should
have some test to check both presence and absence of any feature

### TODO

* upstream proxy: http://www.christianschenk.org/blog/using-a-parent-proxy-with-squid/

### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
