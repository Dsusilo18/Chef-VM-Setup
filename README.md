# vm-setup-cookbook
Configures an ideal set up for a virutal machine running on ARM64. 

## Requirements
Vagrant, Parallels, Chef, Chef InSpec, bento/ubuntu-20.04-arm64

## Usage 
- Start: Kitchen Converge vm-setup
- Test: Kitchen Verify vm-setup
- Stop: Kitchen Destroy vm-setup

## Recipes
1. apt_update.rb
  - updates and install anything the vm needs updating. 

2. configure_plex.rb
  - Use a template to update the Preferences file for Plex Media Server to configure it.

3. default.rb
  - Default recipe containing all the references to the other Recipes.

4. dir_creation.rb
  - Creates all the important directories and files needed.

5. file_download.rb
  - Remotely installs files from the web.

6. gui_install.rb
  - Installs ubuntu-desktop as the GUI for the vm. 

7. package_install.rb
  - Installs all the packages needed to configure the vm. 

8. picture_install.rb
  - Installs the wallpaper for the desktop created from the GUI.

9. user_creation.rb
  - Creates a new user account with priviliges. 

## Attributes:
1. node[‘vm-setup’][‘files_list’]
  - Contains all of the addresses of the files that were just remotely downloaded. 
2. node[‘vm-setup’][‘source_list’]
  - Contains all of the remote address of the files that needs to be installed remotely.

## Templates:
Preferences.xml.erb