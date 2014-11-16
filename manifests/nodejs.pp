class denouche-nodejs::nodejs inherits denouche-nodejs::params {

    file { 'tar':
        path => "/home/nodejs/programs/$nodejsFilename.tar.gz",
        source => "puppet:///modules/denouche-nodejs/$nodejsFilename.tar.gz",
        ensure => present,
        notify => Exec['untar'],
    }

    exec { 'untar':
        cwd => '/home/nodejs/programs',
        command => "/bin/tar xzf /home/nodejs/programs/$nodejsFilename.tar.gz",
        user => 'nodejs',
        refreshonly => true,
        notify   => Exec['project-restart'],
    }
    
}
