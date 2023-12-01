require 'spec_helper'

shared_context 'valid source and path' do
  platform 'mac_os_x'

  default_attributes['vm-setup']['files_list'] = '/Pictures/Background/pexels-photo-1543793.jpeg'
  default_attributes['vm-setup']['source_list'] = 'https://images.pexels.com/photos/1543793/pexels-photo-1543793.jpeg'
  default_attributes['vm-setup']['user_name'] = 'tony'
end

shared_examples 'file is created' do
  it {
    is_expected.to create_remote_file('/home/tony/Pictures/Background/pexels-photo-1543793.jpeg').with(
    source: 'https://images.pexels.com/photos/1543793/pexels-photo-1543793.jpeg',
    owner: 'tony'
  )
  }
end

shared_examples 'base directories created' do
  dirs = ['/home/tony/Downloads', '/home/tony/Pictures',
      '/home/tony/Pictures/Background', '/home/tony/Pictures/Icon',
      '/home/tony/.config/', '/home/tony/snap']

  dirs.each do |dir|
    it { is_expected.to create_directory(dir).with(owner: 'tony') }
  end
end

shared_examples 'error occured' do
  it 'should raise an error' do
    expect { subject }.to raise_error(RuntimeError)
  end
end

describe 'vm-setup::file_management' do
  step_into :file_management

  context 'create base directories with path is not a string' do
    include_context 'valid source and path'

    recipe do
      file_management 'create base directories' do
        path 123
        owner node['vm-setup']['user_name']
        action :create_dir
      end
    end

    it 'should raise an error' do
      expect { subject }.to raise_error(Chef::Exceptions::ValidationFailed)
    end
  end

  context 'create base directories with path string not containing /' do
    include_context 'valid source and path'

    recipe do
      file_management 'create base directories' do
        path 'home'
        owner node['vm-setup']['user_name']
        action :create_dir
      end
    end

    it 'should not raise an error' do
      expect { subject }.to_not raise_error
    end

    it_behaves_like 'base directories created'
  end

  context 'path does not exists' do
    include_context 'valid source and path'

    recipe do
      file_management 'create file' do
        path '/Pictures/Ba/pexels-photo-1543793.jpeg'
        source node['vm-setup']['source_list']
        owner node['vm-setup']['user_name']
        action :create_file
      end
    end

    it_behaves_like 'error occured'
  end

  context "source does not contain '.com'" do
    include_context 'valid source and path'

    recipe do
      file_management 'create file' do
        path '/Pictures/Background/pexels-photo-1543793.jpeg'
        source 'https://images.pexels/photos/1543793/pexels-photo-1543793.jpeg]'
        owner node['vm-setup']['user_name']
        action :create_file
      end
    end

    it_behaves_like 'error occured'
  end

  context "path string does not contain '/' at the start" do
    include_context 'valid source and path'

    recipe do
      file_management 'create remote file' do
        path 'Pictures/Background/pexels-photo-1543793.jpeg'
        source node['vm-setup']['source_list']
        owner node['vm-setup']['user_name']
        action :create_file
      end
    end

    it_behaves_like 'error occured'
  end

  context 'create file without path' do
    include_context 'valid source and path'

    recipe do
      file_management 'create remote file' do
        source node['vm-setup']['source_list']
        owner node['vm-setup']['user_name']
        action :create_file
      end
    end

    it_behaves_like 'error occured'
  end

  context 'create file with correct properties' do
    include_context 'valid source and path'

    recipe do
      file_management 'create remote file' do
        path node['vm-setup']['files_list']
        source node['vm-setup']['source_list']
        owner node['vm-setup']['user_name']
        action :create_file
      end
    end

    it 'should not raise an error' do
      expect { subject }.to_not raise_error
    end

    it_behaves_like 'file is created'
  end

  context 'create base directories with correct properties' do
    include_context 'valid source and path'

    recipe do
      file_management 'create base directories' do
        owner node['vm-setup']['user_name']
        action :create_dir
      end
    end

    it 'should not raise an error' do
      expect { subject }.to_not raise_error
    end

    it_behaves_like 'base directories created'
  end
end
