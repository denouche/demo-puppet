class denouche-nodejs {

    include denouche-nodejs::user
    include denouche-nodejs::nodejs
    include denouche-nodejs::project
    
    Class['denouche-nodejs::user'] ->
    Class['denouche-nodejs::nodejs'] ->
    Class['denouche-nodejs::project']

}
