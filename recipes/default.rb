#
# Cookbook:: test_cookbook
# Recipe:: default
#
# Copyright:: 2023, The Authors, All Rights Reserved.

include_recipe 'test_cookbook::apt_update'
include_recipe 'test_cookbook::gui_install'
include_recipe 'test_cookbook::user_creation'
include_recipe 'test_cookbook::dir_creation'
include_recipe 'test_cookbook::file_download'
include_recipe 'test_cookbook::package_install'
include_recipe 'test_cookbook::picture_install'
