#
# Cookbook:: c9_ide
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'c9_ide::update'
include_recipe 'user::data_bag'
include_recipe 'c9_ide::motd'
include_recipe 'c9_ide::packages'
include_recipe 'c9_ide::cloud9ide'
include_recipe 'c9_ide::supervisor'