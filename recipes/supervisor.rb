package 'supervisor' do
    action :install
end

case node['platform']
when 'debian', 'ubuntu'

	cookbook_file '/etc/supervisor/conf.d/cloud9ide.conf' do
	  source 'c9ide.conf'
	  owner 'root'
	  group 'root'
	  mode '0755'
	  action :create
	end

	execute 'start supervisor' do
	  command 'service supervisor start'
	end

	execute 'reload supervisor' do
	  command 'supervisorctl update'
	end

when 'redhat', 'centos', 'fedora'

	cookbook_file '/etc/supervisord.d/cloud9ide.ini' do
	  source 'c9ide.conf'
	  owner 'root'
	  group 'root'
	  mode '0755'
	  action :create
	end

	execute 'start supervisor' do
	  command 'service supervisord start'
	end

	execute 'reload supervisor' do
	  command 'supervisorctl update'
	end
end

