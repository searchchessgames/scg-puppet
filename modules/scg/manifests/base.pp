# Base setup.
class scg::base {
    package { ['git',
           'nginx',]:
        ensure => present,
    }

    service { 'nginx':
        enable  => true,
        ensure  => running,
        require => [
            Package['nginx'],
        ],
    }

    user { 'scg':
        ensure     => present,
        managehome => true,
    }

    file { ['/home/scg',
            '/home/scg/project',
            '/home/scg/logs', ]:
        ensure  => directory,
        owner   => 'scg',
        require => User['scg'],
    }
}
