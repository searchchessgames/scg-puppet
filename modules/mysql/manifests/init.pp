package { ['mysql-server', 'mysql-client']:
    ensure => present,
}

service { ['mysql-server']:
    ensure => running,
}
