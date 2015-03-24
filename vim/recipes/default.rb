package "vim" do
  action :install
end

### editor exchange nano to vim
#link "/etc/alternatives/editor" do
#  to "/usr/bin/vim"
#end
username = "ec2-user"

template "/home/#{username}/.vimrc" do
  source  "vimrc.erb"
  owner   username
  group   username
  mode    0644
end
