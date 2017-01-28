# Update system to start with
case node['platform']


when 'debian', 'ubuntu'

    execute 'AptUpdateUpgrade' do
        command "apt-get update && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y"
    end

when 'redhat', 'centos', 'fedora'

     # Update all packages
    execute 'UpdateYum' do
        command "yum -y update"
    end

    # Add Fedora's Extra Packages for Enterprise Linux
    execute 'GetEPELRepo' do
        command "rpm -iUvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-9.noarch.rpm"
        not_if "rpm -qa | grep -qx 'epel-release-7-9.noarch'"
    end

end