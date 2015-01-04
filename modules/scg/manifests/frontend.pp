# Install the frontend application.
class scg::frontend {
    nginx::website { 'scg-frontend':
        template => 'nginx/frontend.conf.erb',
    }

    nginx::website { 'scg-www-redirect':
        template => 'nginx/www.conf.erb',
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
