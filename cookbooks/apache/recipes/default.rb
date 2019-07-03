
execute "updat erepo" do
 command "apt-get update"
end

apt_package "apache2" do
 action :install
end

service "apache2" do
 action :start
end

