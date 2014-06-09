#
# Cookbook Name:: laravel
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "php::source"

execute "composer_install" do
	command <<-EOH
		curl -sS https://getcomposer.org/installer | php
		mv composer.phar /usr/local/bin/composer
	EOH
	#action :nothing
end

package "curl" do
	notifies :run, resources(:execute => :composer_install)
end
