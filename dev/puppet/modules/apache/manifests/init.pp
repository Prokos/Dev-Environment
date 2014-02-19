class apache {

	# Enable apache2 package
	package { 'apache2':
		ensure => present
	}

	# Symlink /vagrant to /var/
	file { '/var/www/':
		ensure  => link,
		target  => '/vagrant',
		require => Package['apache2'],
		force   => true
	}

	# Set /etc/hosts file
	file { '/etc/hosts':
		ensure  => present,
		source  => 'puppet:///modules/apache/hosts',
		require => Package['apache2'],
		group   => 'root',
		owner   => 'root'
	}

	# Enable mod_rewrite module by symlink
  	file { '/etc/apache2/mods-enabled/rewrite.load':
  		ensure  => link,
  		target  => '/etc/apache2/mods-available/rewrite.load',
  		require => Package['apache2']
  	}

  	# Clean sites-enabled directory
  	file { '/etc/apache2/sites-enabled':
		ensure  => directory,
		recurse => true,
		purge   => true,
		require => Package['apache2']
  	}

  	# Create site-dev file
  	file { '/etc/apache2/sites-available/site-dev.conf':
  		ensure  => present,
  		source  => 'puppet:///modules/apache/site-dev.conf',
  		require => Package['apache2']
  	}

  	# Enable site-dev by symlink
  	file { '/etc/apache2/sites-enabled/site-dev.conf':
  		ensure  => link,
  		target  => '/etc/apache2/sites-available/site-dev.conf',
  		require => File['/etc/apache2/sites-available/site-dev.conf']
  	}

	# Enable apache2 service
	service { 'apache2':
		ensure    => running,
		require   => Package['apache2'],
		subscribe => [
			File['/etc/hosts'],
			File['/etc/apache2/mods-enabled/rewrite.load'],
			File['/etc/apache2/sites-available/site-dev.conf']
		]
	}

}