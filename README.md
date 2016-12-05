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

A one-maybe-two sentence summary of what the module does/what problem it solves.
This is your 30 second elevator pitch for your module. Consider including
OS/Puppet version it works with.

## Module Description

If applicable, this section should have a brief description of the technology
the module integrates with and what that integration enables. This section
should answer the questions: "What does this module *do*?" and "Why would I use
it?"

If your module has a range of functionality (installation, configuration,
management, etc.) this is the time to mention it.

## Setup

### What squid affects

* A list of files, packages, services, or operations that the module will alter,
  impact, or execute on the system it's installed on.
* This is a great place to stick any warnings.
* Can be in list or paragraph form.

### Setup Requirements

This module requires pluginsync enabled

### Beginning with squid

```puppet
class { 'squid':
		visible_hostname => 'example',
		disable_cache => true,
	}
```

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

## Usage

Put the classes, types, and resources for customizing, configuring, and doing
the fancy stuff with your module here.

## Reference

Here, list the classes, types, providers, facts, etc contained in your module.
This section should include all of the under-the-hood workings of your module so
people know what the module is touching on their system but don't need to mess
with things. (We are working on automating this section!)

## Limitations

This is where you list OS compatibility, version compatibility, etc.

## Development

We are pushing to have acceptance testing in place, so any new feature should
have some test to check both presence and absence of any feature

### TODO

* ACL management
* upstream proxy: http://www.christianschenk.org/blog/using-a-parent-proxy-with-squid/

### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
