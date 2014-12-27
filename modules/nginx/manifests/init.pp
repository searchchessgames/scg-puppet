class nginx {
    package { 'nginx':
        ensure => present,
        require => Package['apache2'],
    }

    package { 'apache2':
        ensure => absent,
    }

    service { 'nginx':
        enable  => true,
        ensure  => running,
        require => [
            Package['nginx'],
            Package['apache2'],
        ],
    }
}
