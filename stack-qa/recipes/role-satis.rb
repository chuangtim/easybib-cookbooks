include_recipe 'ies::role-generic'
include_recipe 'php-fpm'
include_recipe 'php::module-phar'
include_recipe 'php::module-posix'

node.set['composer']['environment'] = get_deploy_user
include_recipe 'composer::configure'

include_recipe 'nginx-app::server'
include_recipe 'stack-qa::deploy-satis'
