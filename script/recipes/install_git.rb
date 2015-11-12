cookbook_file "/tmp/install_git" do
  source "install_git"
  mode 0755
end

execute "install_git" do
  user "root"
  cwd "/tmp"
  command "./install_git"
end
