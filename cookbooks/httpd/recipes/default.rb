
execute "update repo" do
 command "yum update"
end

package "httpd" do
 action :install
end

service "httpd" do
 action [:enable,:start]
end

cookbook_file "/var/www/html/index.html" do
 source "index.html"
 mode "0664"  
end
