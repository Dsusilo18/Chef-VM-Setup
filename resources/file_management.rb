unified_mode true
provides :file_management
default_action :create_dir

property :owner, String, required: true
property :path, String,
         name_property: true,
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
    full_src = "/home/#{new_resource.owner}#{new_resource.path}"
    full_src = full_src.sub(%r{/[^/]*\z}, '')

    path_found = false
    dirs.each do |dir|
      if full_src == dir
        path_found = true
      end
    end
    raise "ERROR: property 'path' must contain an existing directory! Unknown Path: #{full_src}" unless path_found
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
    check_path(get_dirs)
    remote_file "/home/#{new_resource.owner}#{new_resource.path}" do
      source new_resource.source
      owner new_resource.owner
      action :create
    end
  end
end
