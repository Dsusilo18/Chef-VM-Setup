# vm-setup_cookbook CHANGELOG

This file is used to list changes made in each version of the vm-setup cookbook.

## [1.8.3] - 2023-11-16

- Added chef spec test for add_bookmarks, apt_update, dir_creation, picture_install, configure_plex and gui_install.

## [1.8.2] - 2023-11-13

- Created an chef inspec integration test for the file_management resource.
- Created a recipe for the file_management resource.
- Modified 'kitchen.yml' to have a file-management suite that would be used to test the resource. 

## [1.8.1] - 2023-11-08

- Added chef spec test for apt_update, configure_chromium, package_install and user_creation.

## [1.8.0] - 2023-11-06

- Created a resource to handle file and directory creation for simpler configuration by the user. 
- Added an attribute for the wallpaper of the VM. 

## [1.7.1] - 2023-10-18

- Created an inspec test for 'add_bookmarks.rb'

## [1.7.0] - 2023-10-17

- Allow the user to add bookmarks to Chromium by providing the name and url into attributes 'bookmark_name_list' and 'bookmark_url_list'. 
- Modified README to be more up to date as a result of the recent changes. 

## [1.6.3] - 2023-10-9

- Added a spec test for the apt_update.rb to thest all of its execution commands.

## [1.6.2] - 2023-10-2

- Added the Visual Studio Code version to attributes so that user can easily change it.

## [1.6.1] - 2023-9-29

- Added an attribute to allow the user to change the username and password of the user of the machine. Also made the user able to decide if they would like to update Ubuntu on booting or not. 

## [1.6.0] - 2023-8-28

- Chromium can now be configured to have all the settings, preferences, extensions and bookmarks of an already existing chromium. 

## [1.5.0] - 2023-8-24

- Changed the name of the cookbook and kitchen.
- Bypassed the initial setup process for ubuntu and created a test for it. 

## [1.4.2] - 2023-8-21

- Updated README file to be more descriptive.

## [1.4.1] - 2023-8-17

- Added a template to be used to configure the Plex Media Server.

## [1.4.0] - 2023-8-16

- Turned the VM into a Plex Media Server.

## [1.3.1] - 2023-8-14

- Added attributes and refined tests. 

## [1.3.0] - 2023-8-11

- Added a recipe to set up the wallpaper of the VM.
- Created tests for file downloaded and directories created.

## [1.2.0] - 2023-8-10

- Created directories such that the recipe doesn't have to wait untill the GUI is installed to download files remotely.
- Allow the cookbook to install Visual Studio Code into the VM.
- Made chromium able to be installed into the VM.

## [1.1.0] - 2023-8-8

- Created a user other than vargant and test to confirm.
- Installed a GUI into ubuntu and test to verify.  
