include_recipe 'php-fpm::service'
include_recipe 'nginx-app::service'

cluster_name   = get_cluster_name

node['deploy'].each do |application, deploy|

  case application
  when 'research_app'
    next unless allow_deploy(application, 'research_app', 'research_app')
  else
    Chef::Log.info("deploy::#{application} - #{cluster_name} skipped")
    next
  end

  Chef::Log.info("deploy::#{application} - Deployment started.}")
  Chef::Log.info("deploy::#{application} - Deploying as user: #{deploy[:user]} and #{deploy[:group]}")

  easybib_deploy application do
    deploy_data deploy
    app application
    notifies node['easybib-deploy']['php-fpm']['restart-action'], 'service[php-fpm]'
  end

  easybib_nginx application do
    config_template 'research-app.conf.erb'
    domain_name deploy['domains'].join(' ')
    doc_root deploy['document_root']
    access_log      'off'
    notifies :reload, 'service[nginx]', :delayed
    notifies node['easybib-deploy']['php-fpm']['restart-action'], 'service[php-fpm]', :delayed
  end

end
