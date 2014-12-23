# Install the API application.
class scg::api {
    file { '/etc/nginx/sites-enabled/scg-api.conf':
        content => template('scg/nginx/api.conf.erb'),
        owner   => root,
        group   => root,
        mode    => '0644',
        require => Package['nginx'],
        notify  => Service['nginx'],
    }

    exec { 'Install API - git clone':
        command => 'git clone https://github.com/searchchessgames/scg-api.git api/current',
        cwd     => '/home/scg/project',
        creates => '/home/scg/project/api/current',
        require => [
            Package['git'],
            File['/home/scg/project']
        ],
    }

    file { ['/home/scg/project/api/current/var/cache', '/home/scg/project/api/current/var/logs']:
        mode    => '0777',
        owner   => 'scg',
        group   => 'scg',
        require => [
            Exec['Install API - git clone'],
        ],
    }

    exec { 'Install API - get Composer':
        command => 'curl -sS https://getcomposer.org/installer | php',
        cwd     => '/home/scg/project/api/current',
        creates => '/home/scg/project/api/current/composer.phar',
        require => [
            Exec['Install API - git clone'],
        ],
    }

    exec { 'Install API - Composer install':
        command => 'php composer.phar install --no-scripts --optimize-autoloader',
        cwd     => '/home/scg/project/api/current',
        creates => '/home/scg/project/api/current/vendor/autoload.php',
        environment => "COMPOSER_HOME=/home/scg/.composer",
        require => [
            Exec['Install API - git clone'],
            Exec['Install API - get Composer'],
        ],
    }
}
