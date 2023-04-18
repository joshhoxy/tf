resource "aws_instance" "ec2-dev-dmz-bastion" {
  ami = "ami-0f8aef1783704ebc9"
  instance_type = "t2.micro"
  availability_zone = data.aws_availability_zones.all.names[0]
  
  # EC2 종료 방지 옵션. 개발중엔 false 운영단계에서는 true로 변경
  disable_api_termination = false
  
  iam_instance_profile = aws_iam_role.role-dev-ec2-default.name

  network_interface {
    
  }

}

resource "aws_network_interface" "eni-dev-dmz-bst-1" {
    subnet_id = aws_subnet.sbn-dev-dmz-pub-a.id
    private_ips = []

}