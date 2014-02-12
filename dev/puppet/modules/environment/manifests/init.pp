stage { 'first': 
	before => Stage['main'] 
}

class { 'environment':
	stage => first
}

class environment {

	exec { 'update-apt-get': 
		command => '/usr/bin/apt-get update'
	}

	package { 'git':
		ensure  => present,
		require => Exec['update-apt-get']
	}

}