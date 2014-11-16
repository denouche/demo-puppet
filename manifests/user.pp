class denouche-nodejs::user {
    
    user { 'user':
        name => 'nodejs', 
        ensure => present,
        gid => 'users',
        shell => '/bin/bash',
        managehome => true,
    }

    file { [
            '/home/nodejs/programs',
            '/home/nodejs/www',
        ]:
        ensure => directory,
        owner => 'nodejs',
        group => 'users',
        require => User['user'],
    }


}
