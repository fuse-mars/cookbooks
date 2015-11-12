node[:deploy].each do |application, deploy|
  
  java_opts = node['springboot']['java_opts']
  log_file = node['springboot']['log_file']
  port = node['springboot']['port']

  opsworks_deploy_dir 'SpringBoot: Preparing the deployment dir' do
    user deploy[:user]
    group deploy[:group]
    path deploy[:deploy_to]
  end

  opsworks_deploy 'SpringBoot: Deploying the app' do
    deploy_data deploy
    app application
  end
  
  bash 'SpringBoot: Force java 1.8.0' do
    user 'root'
    cwd "#{deploy[:deploy_to]}/current"
    code <<-EOH
        yum remove java-1.7.0-openjdk* -y
    EOH
  end

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
  
  bash 'SpringBoot: Running the deployed' do
    user "root"
    cwd "#{deploy[:deploy_to]}/current"
    code <<-EOH
        java #{java_opts} -Dlogging.file="#{log_file}" -Dserver.port=#{port} -jar *.jar > /dev/null 2>&1 &
    EOH
  end
  
end

