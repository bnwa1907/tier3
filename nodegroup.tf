# #iam role for the node group
# resource "aws_iam_role" "nodes_role" {
#   name = "eks_node_group_nodes"

#   assume_role_policy = jsonencode({
#     Statement = [{
#       Action = "sts:AssumeRole"
#       Effect = "Allow"
#       Principal = {
#         Service = "ec2.amazonaws.com"
#       }
#     }]
#     Version = "2012-10-17"
#   })
# }
# # policies for the node group
# resource "aws_iam_role_policy_attachment" "nodes-AmazonEKSWorkerNodePolicy" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
#   role       = aws_iam_role.nodes_role.name
# }

# resource "aws_iam_role_policy_attachment" "nodes-AmazonEKS_CNI_Policy" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
#   role       = aws_iam_role.nodes_role.name
# }

# resource "aws_iam_role_policy_attachment" "nodes-AmazonEC2ContainerRegistryReadOnly" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
#   role       = aws_iam_role.nodes_role.name
# }

# # node group

# resource "aws_eks_node_group" "web_group" {
#   cluster_name    = aws_eks_cluster.eks.name
#   node_group_name = "web_group"
#   node_role_arn   = aws_iam_role.nodes_role.arn

#   subnet_ids = [
#     aws_subnet.web_sub1a.id, aws_subnet.web_sub1b.id
#   ]

#   launch_template {
#    name = aws_launch_template.eks_cluster_web_templet.name
#    version = aws_launch_template.eks_cluster_web_templet.latest_version
#   }
  


#   scaling_config {
#     desired_size = 2
#     max_size     = 3
#     min_size     = 0
#   }

#   update_config {
#     max_unavailable = 1
#   }

#   labels = {
#     role = "general"
#   }
  
   

#   depends_on = [
#     aws_iam_role_policy_attachment.nodes-AmazonEKSWorkerNodePolicy,
#     aws_iam_role_policy_attachment.nodes-AmazonEKS_CNI_Policy,
#     aws_iam_role_policy_attachment.nodes-AmazonEC2ContainerRegistryReadOnly,
#   ]

  
# }