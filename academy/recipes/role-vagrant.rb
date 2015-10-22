include_recipe 'ohai'
include_recipe 'ies-mysql'
include_recipe 'ies-mysql::dev'
include_recipe 'easybib::role-phpapp'
include_recipe 'nginx-app::vagrant'
include_recipe 'php-pdo_sqlite'
include_recipe 'nodejs'
include_recipe 'avahi'
include_recipe 'stack-service::role-rabbitmq'
include_recipe 'php-xdebug'

package 'build-essential'
package 'g++'
