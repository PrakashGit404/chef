pt_update 'update' do
    action :update
end

remote_file '/opt/apache-maven-3.6.1-bin.tar.gz' do
    source 'http://mirrors.estointernet.in/apache/maven/maven-3/3.6.1/binaries/apache-maven-3.6.1-bin.tar.gz'
    owner 'root'
    group 'root'
    mode '0755'
    action :create
end

file '/var/www/html/login.php' do
    only_if { ::File.exist?('/var/www/html/login.php') }
    action :touch
end

execute '/opt/apache-maven-3.6.1' do
    only_if { ::File.exist?('/opt/apache-maven-3.6.1') }
    action :delete
    command 'tar -xzf /opt/apache-maven-3.6.1-bin.tar.gz -C /opt/apache-maven-3.6.1'
end

file '/root/.profile' do
    action :delete
end

file '/root/.profile' do
    content ' export M2_HOME="/opt/apache-maven-3.6.1"\n export PATH=$M2_HOME/bin:$PATH'
    owner 'root'
    group 'root'
    mode '0755'
    action :create
end

execute '.profile' do
    command 'source /root/.profile'
    action :run
end
