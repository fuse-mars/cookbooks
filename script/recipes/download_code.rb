cookbook_file "/tmp/download_code" do
  source "download_code"
  mode 0755
end

execute "download_code" do
  user "root"
  cwd "/tmp"
  command "./download_code"
end
