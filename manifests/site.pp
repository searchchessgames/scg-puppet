Exec {
    path => "/bin:/usr/bin"
}

if $::hostname =~ /.*\.prod$/ {
    $serverEnv = 'prod'
} elsif $::hostname =~ /.*\.dev$/ {
    $serverEnv = 'dev'
} else {
    $serverEnv = 'dev'
}

$baseHost = $serverEnv ? {
    'prod' => 'searchchessgames.com',
    'dev' => 'searchchessgames.dev',
    default => 'searchchessgames.dev',
}

node default {
    include nginx
    include scg::base
    include scg::api
    include scg::frontend
}
