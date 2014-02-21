#
# Cookbook Name:: mytest
# Recipe:: default
#
# Copyright 2014, Sergey Tsivin
#
# All rights reserved - Do Not Redistribute
#

package "git" do
    action :install
end

package "php5" do
    action :install
end

web_app "my_site" do
    server_name "mytest.wrk"
    server_aliases [ "www.mytest.wrk" ]
    cookbook "apache2"
    docroot "/www/mytest.wrk/htdocs"
end
