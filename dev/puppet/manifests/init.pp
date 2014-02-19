# Set default exec path
Exec {
  path => '/usr/local/bin:/usr/bin:/bin',
}

import "environment"
import "apache"
import "php"
import "mysql"
import "laravel"

include environment
include apache
include php
include mysql
include laravel