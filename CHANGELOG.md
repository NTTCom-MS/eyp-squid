# CHANGELOG

## 0.1.13

* hability to set **access_log** to none

## 0.1.11

* added support for **Debian 10**

## 0.1.10

* Allow http_port to be an array

## 0.1.9

* added **squid::followxff**

## 0.1.8

* bugfix: Ubuntu 16 squid.conf file

## 0.1.7

* updated user defined rules banner

## 0.1.6

* modified **squid::httpaccess** to allow multiple ACLs
* added a variable (**add_default_localnet_rule**) if a default **http_access** rule needs to be included for localnet

## 0.1.5

* added **squid::accesslog**
* added **squid::logformat**
* added **squid::acl**
* added **squid::httpaccess**

## 0.1.4

* dropped centos5 support
* added logrotate management
* added cache_dir settings

## 0.1.3

* manager access rules (squidclient)
* added a variable for visible_hostname
* added 3128 as a safe port (to be able to get stats using squidclient)

## 0.1.2

* added **squid::domain**

## 0.1.1

* changed default listen to 0.0.0.0:3128

## 0.1.0

initial release
