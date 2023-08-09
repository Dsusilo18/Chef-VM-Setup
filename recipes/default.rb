#
# Cookbook:: test_cookbook
# Recipe:: default
#
# Copyright:: 2023, The Authors, All Rights Reserved.

include_recipe 'test_cookbook::apt_update'
include_recipe 'test_cookbook::gui_install'
include_recipe 'test_cookbook::user_creation'