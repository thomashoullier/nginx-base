# NGINX basic configuration
We give a POSIX shellscript to setup a basic `nginx` webserver with TLS
certificates from Let's Encrypt and automatic renewal using `certbot`.

## Usage
### Pre-requisites
You need:
- A working server, typically setup with
https://github.com/thomashoullier/vps-setup
- A domain name, we will refer to it as `xxxxx.xxx`.

### DNS configuration
Add the following host records to your domain:
- *A*: This indicates the IPv4 that is attached to your domain.
- *AAAA*: Same with IPv6.
- *CAA*: Indicates, for security purposes and at the DNS level, 
that your TLS certificates should come from a particular certificate provider.

To specify Let's Encrypt as certificate issuer, enter `letsencrypt.org` in the 
CAA record.
