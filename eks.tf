# resource "aws_iam_role" "eks_role" {
#   name = "eks-role"

#   assume_role_policy = <<POLICY
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "eks.amazonaws.com"
#       },
#       "Action": "sts:AssumeRole"
#     }
#   ]
# }
# POLICY
# }

# resource "aws_iam_role_policy_attachment" "attach-AmazonEKSClusterPolicy" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
#   role       = aws_iam_role.eks_role.name
# }

# resource "aws_eks_cluster" "eks" {
#   name     = "task"
#   role_arn = aws_iam_role.eks_role.arn

#   vpc_config {
#     subnet_ids = [
#       aws_subnet.web_sub1a.id ,aws_subnet.web_sub1b.id, aws_subnet.DB_sub1a.id
#     ]
#   }

#   depends_on = [aws_iam_role_policy_attachment.attach-AmazonEKSClusterPolicy]
# }