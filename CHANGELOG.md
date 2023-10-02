# vm-setup_cookbook CHANGELOG

This file is used to list changes made in each version of the vm-setup cookbook.

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
