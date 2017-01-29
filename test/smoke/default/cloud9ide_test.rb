describe directory('/home/c9ide/core/README.md') do  # describe this directory
	its(:content) { should match /^Cloud9/ }
end

describe port(9999) do
  it { should be_listening }
end