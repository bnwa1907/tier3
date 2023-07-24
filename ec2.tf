#Create EC2 instances in public subnets
resource "aws_instance" "web-1a_ec2" {
  ami                         = "ami-006dcf34c09e50022"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.web_sub1a.id
  security_groups             = [aws_security_group.web_sg.id]


 user_data = <<-EOF
    #!/bin/bash
    sudo yum install -y docker
    sudo service docker start
    sudo chkconfig docker on
    sudo systemctl enable docker.service
    sudo newgrp docker
    sudo usermod -a -G docker ec2-user
    sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    sudo yum install -y git
    sudo git clone https://github.com/bnwa1907/awesome-compose.git 
    cd /awesome-compose/aspnet-mssql/
    docker-compose up -d
    EOF
}

resource "aws_instance" "web-1b_ec2" {
  ami                         = "ami-006dcf34c09e50022"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.web_sub1b.id
  security_groups             = [aws_security_group.web_sg.id]


   user_data = <<-EOF
    #!/bin/bash
    sudo yum install -y docker
    sudo service docker start
    sudo chkconfig docker on
    sudo systemctl enable docker.service
    sudo newgrp docker
    sudo usermod -a -G docker ec2-user
    sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    sudo yum install -y git
    sudo git clone https://github.com/bnwa1907/awesome-compose.git 
    cd /awesome-compose/aspnet-mssql/
    docker-compose up -d
    EOF
}

# Create a Redis instance

# resource "aws_instance" "Redis_ec2" {
#   ami                         = "ami-000dffd12e702f4ab"
#   instance_type               = "t2.micro"
#   associate_public_ip_address = false
#   subnet_id                   = aws_subnet.DB_sub1a.id
#   security_groups             = [aws_security_group.db_sg.id]

# }



resource "aws_instance" "db_ec2" {
  ami                         = "ami-006dcf34c09e50022"
  instance_type               = "t2.micro"
  associate_public_ip_address = false
  subnet_id                   = aws_subnet.DB_sub1a.id
  security_groups             = [aws_security_group.db_sg.id]
}

