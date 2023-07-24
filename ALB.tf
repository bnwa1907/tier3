#Create an ALB target group
resource "aws_lb_target_group" "alb-TG" {
  name     = "alb-TG"
  port     =  80
  protocol = "HTTP"
  vpc_id   = aws_vpc.my_vpc.id
}

#Create Load balancer
resource "aws_lb" "alb" {
  name               = "alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web_sg.id]
  subnets            = [aws_subnet.web_sub1a.id , aws_subnet.web_sub1b.id ]
}

# Create Load balancer listner rule
resource "aws_lb_listener" "alb_lst" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = aws_iam_server_certificate.test_cert.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-TG.arn
  }
}

# Create Load balancer listner rule
resource "aws_lb_listener" "alb_lst2" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"
 
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-TG.arn
  }
}


# Load balancer-Target group attachment
resource "aws_lb_target_group_attachment" "my-aws-alb" {
  target_group_arn = aws_lb_target_group.alb-TG.arn
  target_id        = aws_instance.web-1a_ec2.id
  port             = 80
}
resource "aws_lb_target_group_attachment" "my-aws-alb2" {
  target_group_arn = aws_lb_target_group.alb-TG.arn
  target_id        = aws_instance.web-1b_ec2.id
  port             = 80
}

# resource "aws_lb_target_group_attachment" "my-aws-alb2" {
#   target_group_arn = aws_lb_target_group.alb-TG.arn
#   target_id        = aws_eks_node_group.web_group.id
#   port             = 80
# }

