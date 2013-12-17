#
# Cookbook Name:: slimauth
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "make" do
  action :install
end

gem_package "mysql" do
  action :install
end

mysql_connection_info = {
  :host     => 'localhost',
  :username => 'root',
  :password => node['mysql']['server_root_password']
}

mysql_database_user 'play' do
  connection mysql_connection_info
  password   'playpass'
  action     :create
end

mysql_database 'slimauth-dev' do
  connection mysql_connection_info
  action :create
end

mysql_database_user 'play' do
  connection    mysql_connection_info
  password      'playpass'
  database_name 'slimauth-dev'
  host          '%'
  privileges    [:select,:update,:insert,:delete]
  action        :grant
end
