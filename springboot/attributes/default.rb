default['springboot']['java_opts'] = '-server -Djava.awt.headless=true -Xmx512m -Xms512m -XX:+UseConcMarkSweepGC -XX:+CMSParallelRemarkEnabled -XX:+ScavengeBeforeFullGC -XX:+CMSScavengeBeforeRemark -XX:+PrintGCDateStamps -verbose:gc -XX:+PrintGCDetails -Xloggc:"/var/log/app_gc.log" -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=10 -XX:GCLogFileSize=100M -XX:+HeapDumpOnOutOfMemoryError'
default['springboot']['log_file'] = '/var/log/springboot/log'
default['springboot']['port'] = '8080'
