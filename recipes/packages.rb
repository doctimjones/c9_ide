case node['platform']
when 'debian', 'ubuntu'

    req_packages = ['fail2ban',
                    'gcc',
                    'g++',
                    'git',
                    'htop',
                    'make',
                    'nodejs',
                    'nmap',
                    'npm',
                    'sysstat',
                    'unattended-upgrades',
                    'apt-listchanges']

    req_packages.each do |packs|
      Chef::Log.info("Installing: " + packs)
      package packs do
        action :install
      end
    end

    template '/etc/apt/apt.conf.d/50unattended-upgrades' do
        owner 'root'
        group 'root'
        mode '0644'
        source '50unattended-upgrades.erb'
    end

    template '/etc/apt/apt.conf.d/20auto-upgrades' do
        owner 'root'
        group 'root'
        mode '0644'
        source '20auto-upgrades.erb'
    end

when 'redhat', 'centos', 'fedora'

    req_packages = ['fail2ban',
                    'gcc-c++',
                    'git',
                    'glibc-static',
                    'htop',
                    'make',
                    'nodejs',
                    'nmap',
                    'npm',
                    'sysstat',
                    'yum-cron']

    req_packages.each do |packs|
      Chef::Log.info("Installing: " + packs)
      package packs do
        action :install
      end
    end

    template '/etc/yum/yum-cron.conf' do
        owner 'root'
        group 'root'
        mode '0644'
        source 'yum-cron.conf.erb'
    end

    execute 'systemctl enable yum-cron' do
    end

    execute 'systemctl start yum-cron' do
    end

end