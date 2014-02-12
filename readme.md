### Introduction

This is my personal Vagrant / Puppet dev environment repository. 

Used for future personal projects and the learning of Vagrant, Puppet and server management in general.

### Dependencies

- [VirtualBox](https://www.virtualbox.org/)
- [Vagrant](http://www.vagrantup.com/)
- [Puppet](http://www.puppetlabs.com/puppet)

### Setup

1. Download the .zip of this repository, and unzip it into a new folder
2. Add the following to `/etc/hosts`:

	<VirtualHost *:80>
		ServerName kokos.dev
		ProxyPreserveHost On
		ProxyPass / http://localhost:1337/
		ProxyPassReverse / http://localhost:1337/
	</VirtualHost>

3. Add the following to `/etc/apache2/extra/httpd-vhosts.conf`:

	127.0.0.1 kokos.dev

3. Restart apachectl

	sudo apachectl restart

4. Navigate to the folder from your terminal and run `vagrant up`
5. After provisioning is done, the server will be accessible on http://kokos.dev