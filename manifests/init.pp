Exec {
    path => "/bin:/usr/bin"
}

node default  {
    if $::fqdn =~ /.*\.prod$/ {
        $serverEnv = 'prod'
        $baseHost = 'searchchessgames.com'
    }

    if $::fqdn =~ /.*\.dev$/ {
        $serverEnv = 'dev'
        $baseHost = 'searchchessgames.dev'
    }

    if $serverEnv == '' {
        $serverEnv = 'dev'
        $baseHost = 'searchchessgames.dev'
    }

    include scg::base
    include scg::api
    include scg::frontend
}
