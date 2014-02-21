#
# Cookbook Name:: Yii-app-basic
# Recipe:: default
#
# Copyright 2014, Sergey Tsivin
#
# Licensed under the Apache License, Version 2.0 (the 'License');
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

###### Install software

%w( memcached ).each do |p|
    package p
end

##### Install php packages

%w( php5 php5-memcache php5-curl php5-gd php5-sqlite ).each do |p|
    package p
end

##### Create apache host

include_recipe 'apache2::default'
include_recipe 'apache2::mod_rewrite'

web_app node['yii2-basic-app'][:server_name] do
    server_name node['yii2-basic-app'][:server_name]
    server_aliases [ "www.#{node['yii2-basic-app'][:server_name]}" ]
    directory_index [ "index.php" ]
    allow_override [ "FileInfo", "AuthConfig", "Limit", "Indexes", "Limit" ]
    docroot "#{node['yii2-basic-app'][:project_root]}/web"
end
