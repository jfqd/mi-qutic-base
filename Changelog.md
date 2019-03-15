# Changelog

## 20181018.1

* download munin from extras

## 20181018.0

* switch to pkgsrc trunk
* add cronjob for log cleanup

## 18.3.1

* include openfiles munin-plugin
* increase nagios-plugin version
* ensure beaver service is running
* move svc-notify to mdata-setup

## 18.3.0

* use pkgsrc 2018Q3
* fix cronjobs script
* update munin-plugin version
* send weekly upgrade hin emails
* add ssl-generator script
* add backup option on shutdown
* secure nullmailer config

## 18.2.0

* use pkgsrc 2018Q2

## 18.1.0

* use pkgsrc 2018Q1

## 17.4.7

* stay on 2017Q4
* update munin-plugin version

## 17.4.6

* add a script to list swap-space per process
* add a script to list open-files per process
* increase MUNIN_PLUGIN_VERSION
* add logstash-redis config for beaver

## 17.4.5

* add beaver

## 17.4.4

* include nrpe with config

## 17.4.3

* switch to qutic pkgsrc mirror
* include keyring file with qutic pub key
* add traffic collection script
* add a restore option to startup script
* include smf-health-check

## 17.4.2

* increase munin-plugin version
* add hardening script
* fix gnupg

## 17.4.1

* fix startup script
* fix nfs

## 17.4.0

* use pkgsrc 2017Q4
* add nagios-nrpe and plugins
* include startup-script
* first-time fetch of pkg-vulnerabilities

## 17.3.4

* ensure directory for mountpoint exists
* add syslog.conf and ipf.conf

## 17.3.3

* handle vfstab extensions

## 17.3.2

* include unbound-plugin for munin
* add curl package
* add bash extensions
* add nanorc extensions

## 17.3.1

* rename image to qutic-base-64
* add beats package

## 17.3.0

* qutify image
* based on the excellent work of skylime, original repo: https://github.com/skylime/mi-core-base
