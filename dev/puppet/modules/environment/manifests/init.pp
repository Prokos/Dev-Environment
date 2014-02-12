stage { 'first': 
	before => Stage['main'] 
}

class { 'environment':
	stage => first
}

class environment {

	# Update apt-get package list
	exec { 'apt-get-update':
		command => '/usr/bin/apt-get update'
	}  

	# Install python-software-properties for ppa
	package { 'python-software-properties': 
    	ensure  => present,
    	require => Exec['apt-get-update']
	}

	# Setup ppa repository for latest PHP version
	exec { 'add-php-ppa':
		command => '/usr/bin/add-apt-repository ppa:ondrej/php5',
		require => Package['python-software-properties'],
	}

	# Update apt-get package list again
	exec { 'second-apt-get-update':
		command => '/usr/bin/apt-get update',
		require => Exec['add-php-ppa']
	}

	# Install git
	package { 'git':
		ensure  => present,
		require => Exec['apt-get-update']
	}

}