class laravel {

	# Install composer if it doesn't exist
	exec { 'install-composer':
		command => 'curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin',
		creates => '/usr/local/bin/composer.phar',
		require => Package['php5-cli']
	}

	# Symlink composer.phar to composer
	file { '/usr/bin/composer':
		ensure  => link,
		target  => '/usr/local/bin/composer.phar',
		require => Exec['install-composer']
	}
	
	# Download and install laravel in subdirectory
	exec { 'install-laravel':
		command => 'composer create-project laravel/laravel --prefer-dist /vagrant/laravel',
		creates => '/vagrant/laravel',
		require => File['/usr/bin/composer']
	}	

}