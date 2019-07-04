execute 'update repos' do
  command 'apt-get update'
  action :run
end

package 'apache2' do
  action :install
end

service 'apache2' do
  action :start
end

cookbook_file '/var/www/html/index.html' do
  source 'index.html'
  owner 'root'
  group 'root'
  mode '0755'
end
