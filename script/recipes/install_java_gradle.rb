cookbook_file "/tmp/install_java_gradle" do
  source "install_java_gradle"
  mode 0755
end

execute "install_java_gradle" do
  user "root"
  cwd "/tmp"
  command "./install_java_gradle"
end
