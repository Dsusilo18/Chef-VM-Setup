unified_mode true
provides :file_management
default_action :create_dir

property :owner, String, required: true
property :path, String,
         coerce: proc { |x|
                   warn "WARNING: Property 'path' must be a String that starts with '/'. Setting it to a String starting with '/'" unless x.is_a?(String) && x =~ %r{^/}
                   "/#{x}" unless x.is_a?(String) && x =~ %r{^/}
                   '/' + x unless !(x.is_a? String) || x =~ %r{^/}
                   x if x.is_a?(String) && x =~ %r{^/}
                 },
         description: 'The path to where the file or directory will be.'
property :source, String,
         coerce: proc { |x|
                   raise "ERROR: Property 'source' must be a String containing a url." unless x.include?('.com')
                   x if x.include?('.com')
                 },
         description: 'The source of the file to be created.'

action_class do
  def get_dirs
    ["/home/#{new_resource.owner}/Downloads", "/home/#{new_resource.owner}/Pictures",
        "/home/#{new_resource.owner}/Pictures/Background", "/home/#{new_resource.owner}/Pictures/Icon",
        "/home/#{new_resource.owner}/.config/", "/home/#{new_resource.owner}/snap"]
  end

  def check_path(dirs)
    error = true
    dirs.each do |dir|
      full_src = "/home/#{new_resource.owner}#{new_resource.path}"
      if full_src.include? dir
        error = false
        break
      end
    end
    raise "ERROR: property 'path' must contain an existing directory" unless error == false
  end
end

action :create_dir do
  converge_if_changed(:owner, :path) do
    dirs = get_dirs
    dirs.each do |dir|
      directory dir do
        owner new_resource.owner
        action :create
      end
    end
  end
end

action :create_file do
  converge_if_changed(:owner, :path, :source) do
    dirs = get_dirs
    put dirs
    check_path(dirs)
    remote_file "/home/#{new_resource.owner}#{new_resource.path}" do
      source new_resource.source
      owner new_resource.owner
      action :create
    end
  end
end
