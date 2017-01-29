describe directory('/etc/motd') do  # describe this directory
	its(:content) { should match /A Cloud 9 IDE server/ }
end