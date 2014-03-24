#
# Cookbook Name:: julius
# Recipe:: dictationkit
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

julius_dictationkit_path = "#{Chef::Config['file_cache_path']}/julius-dictation-kit-v#{node['julius']['dictationkit-version']}-linux.tgz"

bash 'unpack_julius_dictationkit' do
  code <<-EOH
      mkdir -p /opt/julius
      cd /opt/julius
      tar xvfz #{julius_dictationkit_path}
  EOH
  action :nothing
end

remote_file julius_dictationkit_path do
  source "http://sourceforge.jp/frs/redir.php?f=%2Fjulius%2F60416%2Fdictation-kit-v#{node['julius']['dictationkit-version']}-linux.tgz"
  action :create_if_missing
  notifies :run, 'bash[unpack_julius_dictationkit]', :immediately
end
