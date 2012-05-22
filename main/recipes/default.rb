# Run apt-get update before the chef convergence stage
r = execute "apt-get update" do
  user "root"
  command "apt-get update"
  action :nothing
end
r.run_action(:run)

# Optional packages that I like to have installed
%w{vim man-db git-core build-essential ruby-dev php5-sqlite}.each do |pkg|
  package pkg do
    action :install
  end
end

require_recipe "openssl"

require_recipe "apache2"
require_recipe "apache2::mod_php5"

node["apache2"]["vhost"].each do |vhost|
  web_app vhost["name"] do
    app_name vhost["name"]
    server_name vhost["server_name"]
    docroot vhost["docroot"]
    dirindex vhost["dirindex"]
    template vhost["template"]
  end
end
execute "disable-default-site" do
  command "sudo a2dissite default"
  notifies :reload, resources(:service => "apache2"), :delayed
end

require_recipe "php"
require_recipe "php::module_mysql"

template "#{node["php"]["apache_conf_dir"]}/php.ini" do
  source "php.ini.erb"
  owner "root"
  group "root"
  mode "0644"
end

template "#{node["php"]["conf_dir"]}/php.ini" do
  source "php.ini.erb"
  owner "root"
  group "root"
  mode "0644"
end

package "php5-intl" do
  action :install
  notifies :reload, resources(:service => "apache2"), :delayed
end
package "php-apc" do
  action :install
  notifies :reload, resources(:service => "apache2"), :delayed
end

php_pear "pear" do
  action :upgrade
end
%w{pear.symfony-project.com pear.phpunit.de components.ez.no}.each do |channel|
  php_pear_channel channel do
    action :discover
  end
end
execute "install phpunit" do
  user "root"
  command "pear install --alldeps phpunit/PHPUnit"
  action :run
  not_if "which phpunit"
end
package "php5-xdebug" do
  action :install
end

require_recipe "mysql"
require_recipe "mysql::server"

gem_package "mysql" do
  action :install
end

require_recipe "database"

mysql_connection_info = {:host => "localhost", :username => "root", :password => node["mysql"]["server_root_password"]}
node["database"]["databases"].each do |db|
  mysql_database db["name"] do
    connection mysql_connection_info
    action :create
  end
end
node["database"]["users"].each do |user|
  mysql_database_user user["name"] do
    connection mysql_connection_info
    password user["password"]
    database_name user["database_name"]
    privileges user["privileges"]
    action :create
    action :grant
  end
end

require_recipe "python"

gem_package "sass" do
  action :install
end