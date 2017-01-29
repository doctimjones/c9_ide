if os[:family] == 'debian'
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
      describe package(packs) do
      	it { should be_installed }
      end
    end

else
  
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
      describe package(packs) do
      	it { should be_installed }
      end
    end
end