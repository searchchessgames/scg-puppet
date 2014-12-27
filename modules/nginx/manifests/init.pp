# Manages Nginx.
class nginx {
    package { 'nginx':
        ensure => present,
        require => Package['apache2'],
    }

    package { 'apache2':
        ensure => absent,
    }

    service { 'nginx':
        ensure  => running,
        enable  => true,
        require => [
            Package['nginx'],
            Package['apache2'],
        ],
    }
}
