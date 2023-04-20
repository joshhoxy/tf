resource "aws_vpc" "vpc-dev-int" {
  cidr_block           = var.vpc-dev-int-cidr
  enable_dns_hostnames = true
  tags = merge(
    {
      Name      = var.vpc-dev-int-name
      "Purpose" = "Test"
    },
    var.tags-common
  )
}


### Outputs ### 
output "vpc-dev-int-id" {
  value = aws_vpc.vpc-dev-int.id
}