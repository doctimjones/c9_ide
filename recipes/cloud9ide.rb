git "/home/c9ide/core" do
   repository 'https://github.com/c9/core.git'
   reference 'master'
   action :sync
end

case node['platform']
when 'debian', 'ubuntu'
	bash 'create nodejs link' do
		code <<-EOH
		ln -s /usr/bin/nodejs /usr/bin/node
		EOH
		not_if { ::File.exist?('/usr/bin/node') }
	end
end

bash 'install_cloud9ide' do
   cwd '/home/c9ide/core/'
   user 'root'
   code <<-EOH
     scripts/install-sdk.sh
     EOH
   environment 'PREFIX' => '/usr/local'
end