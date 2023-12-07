require 'spec_helper'

describe 'vm-setup::dependency' do
  platform 'mac_os_x'

  shared_examples 'should not raise an error' do
    it 'no error was raised' do
      expect { subject }.to_not raise_error
    end
  end

  describe 'check bookmark list' do
    context 'bookmark_name_list is not equal to bookmark_url_list' do
      default_attributes['vm-setup']['bookmark_name_list'] = 'test-name'
      default_attributes['vm-setup']['bookmark_url_list'] = 'test-url'
      include_examples 'should not raise an error'
    end
    context 'bookmark_name_list is equal to bookmark_url_list' do
      default_attributes['vm-setup']['bookmark_name_list'] = 'test'
      default_attributes['vm-setup']['bookmark_url_list'] = 'test'
      it 'Should raise an error' do
        expect { subject }.to raise_error('ERROR: bookmark name list in attributes must not be empty.')
      end
    end
    context 'bookmark_url_list is equal to code_version' do
      default_attributes['vm-setup']['code_version'] = 'test'
      default_attributes['vm-setup']['bookmark_url_list'] = 'test'
      it 'Should raise an error' do
        expect { subject }.to raise_error('ERROR: bookmark url list in attributes must not be empty.')
      end
    end
    context 'bookmark_name_list is empty' do
      default_attributes['vm-setup']['bookmark_name_list'] = ''
      it 'Should raise an error' do
        expect { subject }.to raise_error('ERROR: bookmark name list in attributes must be a String or Array and not be empty or nil.')
      end
    end
    context 'bookmark_url_list is empty' do
      default_attributes['vm-setup']['bookmark_url_list'] = ''
      it 'Should raise an error' do
        expect { subject }.to raise_error('ERROR: bookmark url list in attributes must be a String or Array and not be empty or nil.')
      end
    end
    context 'bookmark_name_list is nil and not a string or array' do
      default_attributes['vm-setup']['bookmark_name_list'] = nil
      it 'Should raise an error' do
        expect { subject }.to raise_error('ERROR: bookmark name list in attributes must be a String or Array and not be empty or nil.')
      end
    end
    context 'bookmark_url_list is nil and not a string or array' do
      default_attributes['vm-setup']['bookmark_url_list'] = nil
      it 'Should raise an error' do
        expect { subject }.to raise_error('ERROR: bookmark url list in attributes must be a String or Array and not be empty or nil.')
      end
    end
  end

  describe 'check files and source list' do
    context 'files_list is not equal to source_list' do
      default_attributes['vm-setup']['files_list'] = 'test-file'
      default_attributes['vm-setup']['source_list'] = 'test-source'
      include_examples 'should not raise an error'
    end
    context 'files_list is equal to source_url_list' do
      default_attributes['vm-setup']['files_list'] = 'test'
      default_attributes['vm-setup']['source_list'] = 'test'
      it 'Should raise an error' do
        expect { subject }.to raise_error('ERROR: files list in attributes must not be empty.')
      end
    end
    context 'files_list is empty' do
      default_attributes['vm-setup']['files_list'] = ''
      it 'Should raise an error' do
        expect { subject }.to raise_error('ERROR: files list in attributes must be a String or Array and not be empty or nil.')
      end
    end
    context 'source_list is empty' do
      default_attributes['vm-setup']['source_list'] = ''
      it 'Should raise an error' do
        expect { subject }.to raise_error('ERROR: source list in attributes must be a String or Array and not be empty or nil.')
      end
    end
    context 'files_list is nil and not a string or array' do
      default_attributes['vm-setup']['files_list'] = nil
      it 'Should raise an error' do
        expect { subject }.to raise_error('ERROR: files list in attributes must be a String or Array and not be empty or nil.')
      end
    end
    context 'source_list is nil and not a string or array' do
      default_attributes['vm-setup']['source_list'] = nil
      it 'Should raise an error' do
        expect { subject }.to raise_error('ERROR: source list in attributes must be a String or Array and not be empty or nil.')
      end
    end
    context 'source_list is equal to background' do
      default_attributes['vm-setup']['source_list'] = 'test'
      default_attributes['vm-setup']['background'] = 'test'
      it 'Should raise an error' do
        expect { subject }.to raise_error('ERROR: source list in attributes must not be empty.')
      end
    end
  end

  describe 'check user name and pass' do
    context 'user_name is not equal to user_pass' do
      default_attributes['vm-setup']['user_name'] = 'test-name'
      default_attributes['vm-setup']['user_pass'] = 'test-pass'
      include_examples 'should not raise an error'
    end
    context 'user_name is equal to user_pass' do
      default_attributes['vm-setup']['user_name'] = 'test'
      default_attributes['vm-setup']['user_pass'] = 'test'
      it 'Should raise an error' do
        expect { subject }.to raise_error('ERROR: user name in attributes must not be empty.')
      end
    end
    context 'user_name is empty' do
      default_attributes['vm-setup']['user_name'] = ''
      it 'Should raise an error' do
        expect { subject }.to raise_error('ERROR: user name in attributes must be a String and not be empty or nil.')
      end
    end
    context 'user_pass is empty' do
      default_attributes['vm-setup']['user_pass'] = ''
      it 'Should raise an error' do
        expect { subject }.to raise_error('ERROR: user pass in attributes must be a String and not be empty or nil.')
      end
    end
    context 'user_name is nil and not a string' do
      default_attributes['vm-setup']['user_name'] = nil
      it 'Should raise an error' do
        expect { subject }.to raise_error('ERROR: user name in attributes must be a String and not be empty or nil.')
      end
    end
    context 'user_pass is nil and not a string' do
      default_attributes['vm-setup']['user_pass'] = nil
      it 'Should raise an error' do
        expect { subject }.to raise_error('ERROR: user pass in attributes must be a String and not be empty or nil.')
      end
    end
    context 'user_pass is equal to bookmark_name_list' do
      default_attributes['vm-setup']['user_pass'] = 'test'
      default_attributes['vm-setup']['bookmark_name_list'] = 'test'
      it 'Should raise an error' do
        expect { subject }.to raise_error('ERROR: user pass in attributes must not be empty.')
      end
    end
  end

  describe 'check background' do
    context 'background is not equal to upgrade_ubuntu' do
      default_attributes['vm-setup']['background'] = 'test-url.com'
      default_attributes['vm-setup']['upgrade_ubuntu'] = false
      include_examples 'should not raise an error'
    end
    context 'background is empty' do
      default_attributes['vm-setup']['background'] = ''
      it 'Should raise an error' do
        expect { subject }.to raise_error('ERROR: background in attributes must be a String and not be empty or nil.')
      end
    end
    context 'background is nil and not a string' do
      default_attributes['vm-setup']['background'] = nil
      it 'Should raise an error' do
        expect { subject }.to raise_error('ERROR: background in attributes must be a String and not be empty or nil.')
      end
    end
  end

  describe 'check code_version' do
    context 'code_version is not equal to files_list' do
      default_attributes['vm-setup']['code_version'] = 'version123'
      default_attributes['vm-setup']['files_list'] = 'test-files'
      include_examples 'should not raise an error'
    end
    context 'code_version is equal to files_list' do
      default_attributes['vm-setup']['code_version'] = 'test-files'
      default_attributes['vm-setup']['files_list'] = 'test-files'
      it 'Should raise an error' do
        expect { subject }.to raise_error('ERROR: code version in attributes must not be empty.')
      end
    end
    context 'code_version is empty' do
      default_attributes['vm-setup']['code_version'] = ''
      it 'Should raise an error' do
        expect { subject }.to raise_error('ERROR: code version in attributes must be a String and not be empty or nil.')
      end
    end
    context 'code_version is nil and not a string' do
      default_attributes['vm-setup']['code_version'] = nil
      it 'Should raise an error' do
        expect { subject }.to raise_error('ERROR: code version in attributes must be a String and not be empty or nil.')
      end
    end
  end

  describe 'check upgrade ubuntu' do
    context 'upgrade ubuntu is nil' do
      default_attributes['vm-setup']['upgrade_ubuntu'] = nil
      it 'Should raise an error' do
        expect { subject }.to raise_error('ERROR: flag to upgrade ubuntu must be a boolean.')
      end
    end
    context 'upgrade ubuntu is not boolean' do
      default_attributes['vm-setup']['upgrade_ubuntu'] = 'test'
      it 'Should raise an error' do
        expect { subject }.to raise_error('ERROR: flag to upgrade ubuntu must be a boolean.')
      end
    end
    context 'upgrade ubuntu is not nil' do
      default_attributes['vm-setup']['upgrade_ubuntu'] = true
      it 'Should not raise an error' do
        expect { subject }.to_not raise_error
      end
    end
  end
end
