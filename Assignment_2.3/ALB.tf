
#Load Balancer for WEB
resource "aws_lb" "cloudethix-lb" {
  name                       = "application-lb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.alb_sg.id]
  subnets                    = [aws_subnet.cloudethix-sub-public01.id, aws_subnet.cloudethix-sub-public02.id]
  tags = {
    Environment = "ALB"
  }
}