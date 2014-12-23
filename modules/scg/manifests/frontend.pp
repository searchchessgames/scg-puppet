# Install the frontend application.
class scg::frontend {
    file { '/etc/nginx/sites-enabled/scg-frontend.conf':
        content => template('scg/nginx/frontend.conf.erb'),
        owner   => root,
        group   => root,
        mode    => '0644',
        require => Package['nginx'],
        notify  => Service['nginx'],
    }

    exec { 'Install web frontend - git clone':
        command => 'git clone https://github.com/searchchessgames/scg-web-frontend.git frontend/current',
        cwd     => '/home/scg/project',
        creates => '/home/scg/project/frontend/current',
        require => [
            Package['git'],
            File['/home/scg/project']
        ],
    }

    package { 'nodejs':
        ensure => present,
    }
}
