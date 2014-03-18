#
# Cookbook Name:: julius
# Recipe:: default
#
# Copyright 2014, Yosuke Matsusaka
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "apt"
include_recipe "build-essential"
include_recipe "cvs"

cvs "#{Chef::Config['file_cache_path']}/julius" do
  cvsroot ':pserver:anonymous@cvs.sourceforge.jp:/cvsroot/julius'
  repository "julius4"
  action :sync
  notifies :run, "bash[compile_julius]", :immediately
end

bash "compile_julius" do
  cwd "#{Chef::Config['file_cache_path']}/julius"
  code <<-EOH
      ./configure
      make clean && make && make install
  EOH
  action :nothing
end
