package "zsh" do
  action :install
end

username = 'ec2-user'

git "/home/#{username}/.oh-my-zsh" do
  repository  "git://github.com/robbyrussell/oh-my-zsh.git"
  reference   "master"
  action      :checkout
  user        username
  group       username
end

template "/home/#{username}/.zshrc" do
  path    "/home/#{username}/.zshrc"
  source  "zshrc.erb"
  owner   username
  group   username
  mode    0644
end

execute "set zsh as default shell" do
  command "chsh -s $(which zsh) #{username}"
end