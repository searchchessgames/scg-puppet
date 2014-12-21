# Base setup.
class scg::base {
    package { 'nginx':
        ensure => 'present',
    }

    package { 'git':
        ensure => 'present'
    }

    service { 'nginx':
        enable  => true,
    }

    user { 'scg':
        ensure     => 'present',
        managehome => true,
    }

    file { ['/home/scg', '/home/scg/project', '/home/scg/logs']:
        ensure  => directory,
        owner   => 'scg',
        require => User['scg']
    }
}
