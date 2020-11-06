# mi-qutic-base

This repository is based on [Joyent mibe](https://github.com/joyent/mibe).

## description

Basic qutic mibe image with default setup of infrastructure services like
munin and remote syslog. This should be the default image for all qutic zones.

## mdata variables

### admin authorized_keys

Configure ssh public key for admin user via `mdata` variable.

- `admin_authorized_keys`: ssh public key for the admin user

### root authorized_keys

Configure ssh public key for root user via `mdata` variable.

- `root_authorized_keys`: ssh public key for the root user

### root ssh public private key

Configure ssh public and private key pair for root user via `mdata`. We only
support rsa keys.

- `root_ssh_rsa`: private ssh rsa key for root user
- `root_ssh_rsa_pub`: public ssh key for root user (mostly not required)

### munin

List of ip addresses of the munin master server that is allowed to connect. The ip addresses should be seperated by whitespace or newline.

- `munin_master_allow`: ip addresses (alternative hostname) of the munin master node

### postfix

To have cron emails on errors we like to configure nullmailer as local smtp server.

- `mail_smarthost`: hostname of remote smtp server
- `mail_auth_user`: smtp username for authentication
- `mail_auth_pass`: smtp password for authentication
- `mail_adminaddr`: admin email address for everything from root@localhost

### ssh daemon

Configure ssh public and private key pairs for the host daemon via `mdata`.

- `ssh_host_rsa_key`:     private SSH rsa key
- `ssh_host_rsa_key.pub`: public SSH rsa key
- `ssh_host_dsa_key`:     private SSH dsa key
- `ssh_host_dsa_key.pub`: public SSH dsa key

## installation

The following sample can be used to create a zone running a copy of the the qutic-base image.

```
BASE_IMAGE_UUID=$(imgadm list | grep 'qutic-base-64' | tail -1 | awk '{ print $1 }')
vmadm create << EOF
{
  "brand":      "joyent",
  "image_uuid": "$BASE_IMAGE_UUID",
  "alias":      "base-image",
  "hostname":   "base.example.com",
  "dns_domain": "example.com",
  "resolvers": [
    "80.80.80.80",
    "80.80.81.81"
  ],
  "nics": [
    {
      "interface": "net0",
      "nic_tag":   "admin",
      "ip":        "10.10.10.10",
      "gateway":   "10.10.10.1",
      "netmask":   "255.255.255.0"
    }
  ],
  "max_physical_memory": 1024,
  "max_swap":            1024,
  "quota":                 10,
  "cpu_cap":              100,
  "customer_metadata": {
    "admin_authorized_keys": "your-long-key",
    "root_authorized_keys":  "your-long-key",
    "mail_smarthost":        "mail.example.com",
    "mail_auth_user":        "you@example.com",
    "mail_auth_pass":        "smtp-account-password",
    "mail_adminaddr":        "report@example.com",
    "munin_master_allow":    "munin-master-ip",
    "nagios_allow":          "nagios-master-ip",
    "logstash_redis":        "redis://10.10.10.20:6379/0,redis://10.10.10.21:6379/0",
    "vfstab":                "storage.example.com:/export/data    -       /data    nfs     -       yes     rw,bg,intr"
  }
}
EOF
```

## todo

* remove beaver and use beats
