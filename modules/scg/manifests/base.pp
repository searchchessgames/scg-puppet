# Base setup.
class scg::base {
    package { ['git']:
        ensure => present,
    }

    user { 'scg':
        ensure     => present,
        comment    => 'searchchessgames.com',
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
