# resource "aws_launch_template" "eks_cluster_web_templet" {
#   name = "eks_cluster_tainted_worker_node_launch_config"
#   block_device_mappings {
#     device_name = "templet"
    
#     ebs {
#       volume_size = 20
#       delete_on_termination = true
#       volume_type = "gp2"
#     }
#   }
 
  
#   user_data =  base64encode(<<-EOF
#      #!/bin/bash
#      sudo yum install -y docker
#      sudo service docker start
#      sudo chkconfig docker on
#      sudo systemctl enable docker.service
#      sudo newgrp docker
#      sudo usermod -a -G docker ec2-user
#      sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
#      sudo chmod +x /usr/local/bin/docker-compose
#      sudo yum install -y git
#      sudo git clone https://github.com/bnwa1907/awesome-compose.git 
#      cd /awesome-compose/aspnet-mssql/
#      docker-compose up -d
#      EOF
#   )
# }
