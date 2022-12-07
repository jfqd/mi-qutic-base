# Changelog

## 20220708.3 - 2022-12-07

* fix pkgrc uri sed 

## 20220708.2 - 2022-10-08

* change smartos.org too
* allow rsa

## 20220708.1

* link pkgin log into place

## 20220708.0

* use latest base image 20220708
* pkgsrc mnx migration

## 20201019.5

* remove munin and use plugins directly
* remove nano and use vim as editor
* remove pkgin fix
* renumber mdata-script

## 20201019.4

* remove beaver and use beats

## 20201019.3

* use beaver with python 3.9

## 20201019.2

* get latest trunk packages

## 20201019.1

* update ruby to 2.7
* deactivate cronjobs

## 20201019.0

* fix perl 5.34 update issues
* remove nrpe fragments
* build image on base 20201019

## 20191127.7

* update ruby to 2.6
* add change-cert script

## 20191127.6

* fix df command in sm-summary
* new script for password-creation
* fixed ssl-expire script

## 20191127.5

* remove munin and nagios and add zabbix to firewall config
* remove nagios plugins download
* nullmailer should use port 587
* cleanup packages file

## 20191127.4

* remove execution of zabbix-system for now
* create nonexistent
* ensure svcs repo-server restart on failure
* update uptodate
* add packages back in

## 20191127.3

* increase munin-plugin version
* add easy update including common issue fixes
* remove nagios support

## 20191127.2

* move checks into zabbix_system script

## 20191127.1

* we may wanna use hexdump
* ensure nullmailer got config changes
* add zabbix-agent config

## 20191127.0

* use latest smartos image 20191127
* cleanup mdata-store after zoneinit
* switch openssl to 1.1.1
* fix pkgin mibe issue

## 20181018.4

* use latest munin from trunk

## 20181018.3

* add nagios check for sidekiq
* add more munin-plugins
* let mount not block provisioning

## 20181018.2

* update munin- and nagios-plugins
* add a nullmailer check

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
