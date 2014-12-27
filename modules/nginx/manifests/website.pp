# Setup an Nginx config file.
define nginx::website($template) {
    file { "/etc/nginx/sites-enabled/${name}.conf":
        content => template($template),
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        require => Package['nginx'],
        notify  => Service['nginx'],
    }
}
