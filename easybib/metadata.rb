name              'easybib'
maintainer        'Till Klampaeckel'
maintainer_email  'till@php.net'
license           'BSD License'
description       "Tools we'd like on all servers."
version           '0.1'
recipe            'easybib::awscommand', "Installs Timothy Kay's aws command"
recipe            'easybib::nginxstats', 'Script to show current stats.'

supports 'ubuntu'

depends 'apt'
depends 'apache-solr'
depends 'apache-couchdb'
depends 'awscli'
depends 'bash'
depends 'chef_handler'
depends 'chef_handler_sns'
depends 'cron'
depends 'composer'
depends 'easybib-deploy'
depends 'ies'
depends 'ies-mysql'
depends 'dnsmasq'
depends 'ezproxy'
depends 'gearmand'
depends 'haproxy'
depends 'memcache'
depends 'nodejs'
depends 'nginx-lb'
depends 'nginx-app'
depends 'pecl-manager'
depends 'ohai'
depends 'ops'
depends 'php-fpm'
depends 'php'
depends 'php-pear'
depends 'php-phar'
depends 'php-poppler-pdf'
depends 'php-posix'
depends 'php-zip'
depends 'php-zlib'
depends 'php-xdebug'
depends 'postfix'
depends 'redis'
depends 'rsyslogd'
depends 'stack-service'
depends 'sinopia'
depends 'sinopia-github'
depends 'smokeping'
depends 'snooze'
depends 'supervisor'
depends 'tideways'
depends 'hhvm-fcgi'
depends 'statsd'
depends 'fail2ban'
