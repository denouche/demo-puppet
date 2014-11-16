class denouche-nodejs::project inherits denouche-nodejs::params {

    vcsrepo { 'project-clone':
        path => '/home/nodejs/www/myapp',
        ensure   => latest,
        provider => git,
        source   => 'https://github.com/denouche/demo-puppet-nodejs-helloworld.git',
        notify   => Exec['project-install'],
        user     => 'nodejs',
        group    => 'users',
    }
    
    exec { 'project-install':
        cwd => "/home/nodejs/www/myapp",
        command => "/home/nodejs/programs/$nodejsFilename/bin/npm install",
        user    => 'nodejs',
        refreshonly => true,
        notify   => Exec['project-restart'],
    }

    exec { 'project-restart':
        cwd => "/home/nodejs/www/myapp",
        command => "/usr/bin/killall node; /home/nodejs/programs/$nodejsFilename/bin/node app.js &",
        user    => 'nodejs',
        refreshonly => true,
    }

}
