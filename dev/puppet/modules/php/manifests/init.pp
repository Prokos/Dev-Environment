class php {

	# Install php5
	package { 'php5':
		ensure  => present,
		require => Package['apache2'],
		notify  => Service['apache2']
	}

	# Install php5-common
	package { 'php5-common':
		ensure  => present,
		require => Package['php5'],
		notify  => Service['apache2']
	}

	# Install php5-cli
	package { 'php5-cli':
		ensure  => present,
		require => Package['php5'],
		notify  => Service['apache2']
	}

	# Install php5-curl
	package { 'php5-curl':
		ensure  => present,
		require => Package['php5'],
		notify  => Service['apache2']
	}

	# Install php5-dev
	package { 'php5-dev':
		ensure  => present,
		require => Package['php5'],
		notify  => Service['apache2']
	}

	# Install php5-geoip
	package { 'php5-geoip':
		ensure  => present,
		require => Package['php5'],
		notify  => Service['apache2']
	}

	# Install php5-imagick
	package { 'php5-imagick':
		ensure  => present,
		require => Package['php5'],
		notify  => Service['apache2']
	}

	# Install php5-mysql
	package { 'php5-mysql':
		ensure  => present,
		require => Package['php5'],
		notify  => Service['apache2']
	}

	# Install libapache2-mod-php5
	package { 'libapache2-mod-php5':
		ensure  => present,
		require => [
			Package['apache2'],
			Package['php5']
		],
		notify  => Service['apache2']
	}

}