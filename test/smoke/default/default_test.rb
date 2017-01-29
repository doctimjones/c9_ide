# # encoding: utf-8

# Inspec test for recipe c9_ide::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe user('c9ide') do
    it { should exist }
end



