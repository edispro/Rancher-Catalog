
logstash-1:
  restart: always
  tty: true
  {{- if ne .Values.mem_limit ""}}
  mem_limit: ${mem_limit}
  {{- end}}
  external_links:
  - ${elasticsearch_link}:elasticsearch
  - ${mysql_link}:mysql
  volumes:
  - ${file_path}:/mnt/logstash
  - ${config_path1}:/etc/logstash  
  command:
  - logstash
  - -f
  - /etc/logstash
  image: edispro/logstash:6.5.1
  stdin_open: true
    {{- if ne .Values.cpuset1 ""}}
  cpuset: '${cpuset1}'
    {{- end}}
  environment:
    xpack.monitoring.enabled: false    
  labels:
    io.rancher.container.hostname_override: container_name  
logstash-2:
  restart: always
  tty: true
  {{- if ne .Values.mem_limit ""}}
  mem_limit: ${mem_limit}
  {{- end}}
  external_links:
  - ${elasticsearch_link}:elasticsearch
  - ${mysql_link}:mysql
  volumes:
  - ${file_path}:/mnt/logstash
  - ${config_path2}:/etc/logstash  
  command:
  - logstash
  - -f
  - /etc/logstash
  image: edispro/logstash:6.5.1
  stdin_open: true
    {{- if ne .Values.cpuset2 ""}}
  cpuset: '${cpuset2}'
    {{- end}}
  environment:
    xpack.monitoring.enabled: false        
  labels:
    io.rancher.container.hostname_override: container_name   
logstash-3:
  restart: always
  tty: true
  {{- if ne .Values.mem_limit ""}}
  mem_limit: ${mem_limit}
  {{- end}}
  external_links:
  - ${elasticsearch_link}:elasticsearch
  - ${mysql_link}:mysql
  volumes:
  - ${file_path}:/mnt/logstash
  - ${config_path3}:/etc/logstash  
  command:
  - logstash
  - -f
  - /etc/logstash
  image: edispro/logstash:6.5.1
  stdin_open: true
    {{- if ne .Values.cpuset3 ""}}
  cpuset: '${cpuset3}'
    {{- end}}
  environment:
    xpack.monitoring.enabled: false         
  labels:
    io.rancher.container.hostname_override: container_name
logstash-4:
  restart: always
  tty: true
  {{- if ne .Values.mem_limit ""}}
  mem_limit: ${mem_limit}
  {{- end}}
  external_links:
  - ${elasticsearch_link}:elasticsearch
  - ${mysql_link}:mysql
  volumes:
  - ${file_path}:/mnt/logstash
  - ${config_path4}:/etc/logstash  
  command:
  - logstash
  - -f
  - /etc/logstash
  image: edispro/logstash:6.5.1
  stdin_open: true
    {{- if ne .Values.cpuset4 ""}}
  cpuset: '${cpuset4}'
    {{- end}}
  environment:
    xpack.monitoring.enabled: false
    pipeline.batch.size: 2000          
  labels:
    io.rancher.container.hostname_override: container_name   
logstash-5:
  restart: always
  tty: true
  {{- if ne .Values.mem_limit ""}}
  mem_limit: ${mem_limit}
  {{- end}}
  external_links:
  - ${elasticsearch_link}:elasticsearch
  - ${mysql_link}:mysql
  volumes:
  - ${file_path}:/mnt/logstash
  - ${config_path5}:/etc/logstash  
  command:
  - logstash
  - -f
  - /etc/logstash
  image: edispro/logstash:6.5.1
  stdin_open: true
    {{- if ne .Values.cpuset5 ""}}
  cpuset: '${cpuset5}'
    {{- end}}
  environment:
    xpack.monitoring.enabled: false
    pipeline.batch.size: 2000         
  labels:
    io.rancher.container.hostname_override: container_name        
    io.rancher.sidekicks: logstash-1,logstash-2,logstash-3,logstash-4   
 
