node[:deploy].each do |application, deploy|
  
  log_file = node['springboot']['log_file']
  port = node['springboot']['port']

  bash 'SpringBoot: Shutting down the current running' do
    user 'root'
    cwd "#{deploy[:deploy_to]}/current"
    code <<-EOH
        curl -XPOST "http://localhost:#{port}/admin/shutdown" > /dev/null 2>&1 || : 
	RETVAL=$?
	if [ $RETVAL -eq 0 ]
	then
		echo "Service stopped"
	else
		echo "Can not stop the service"
	fi
	exit 0
    EOH
  end
  
end
