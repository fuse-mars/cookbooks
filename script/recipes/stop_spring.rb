cookbook_file "/tmp/stop_spring" do
  source "stop_spring"
  mode 0755
end

execute "stop_spring" do
  user "root"
  cwd "/tmp"
  command "./stop_spring"
end
