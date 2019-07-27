# NGINX basic configuration
We give a POSIX shellscript to setup a basic `nginx` webserver with TLS
certificates from Let's Encrypt and automatic renewal using `certbot`.

This works for Ubuntu 18.04 servers.

## Usage
Familiarity with `nginx` and `certbot` is expected. The script merely automates
what a human administrator would do to setup these tools. Things can go wrong
and you need to be able to detect when this is the case.

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

### Launching the script
Switch to the folder in which `webserver.sh` is and run:

```shell
./webserver.sh mario@192.168.0.1 xxxxx.xxx
```

Replacing:
* *mario@192.168.0.1* with the adequate user and IP.
* *xxxxx.xxx* with the adequate domain name.

## Test
- If you go to `xxxxx.xxx/testpage.html` you should see the html test page. You
should also have been automatically redirected to HTTPS.
- On your server, you can run `sudo certbot renew --dry-run` to make sure the
automatic certificates renewal will work when the time comes.
