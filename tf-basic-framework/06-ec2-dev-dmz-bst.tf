resource "aws_instance" "ec2-dev-dmz-bastion" {
  ami               = "ami-0f8aef1783704ebc9"
  instance_type     = "t2.micro"
  availability_zone = data.aws_availability_zones.all.names[0]

  # EC2 종료 방지 옵션. 개발중엔 false 운영단계에서는 true로 변경
  disable_api_termination = false

  iam_instance_profile = aws_iam_role.role-dev-ec2-default.name

  network_interface {
    network_interface_id = aws_network_interface.eni-dev-dmz-bst-1.id
    device_index         = 0
  }

  user_data = filebase64("./userdata-default.sh")

  root_block_device {
    volume_type           = "gp3"
    volume_size           = 20
    encrypted             = true
    kms_key_id            = var.key-cmk-ebs-arn
    delete_on_termination = true

    tags = merge(
      {
        Name    = "${var.ec2-dev-dmz-bst-name}-ROOT"
        KMSType = "CMK-EBS"
        Purpose = "Test"
      },
      var.tags-common
    )
  }

  tags = merge(
    {
      Name    = var.ec2-dev-dmz-bst-name
      Purpose = "Test"
    },
    var.tags-common
  )

}

resource "aws_network_interface" "eni-dev-dmz-bst-1" {
  subnet_id       = aws_subnet.sbn-dev-dmz-pub-a.id
  private_ips     = [var.ec2-dev-dmz-bst-ip]
  security_groups = [aws_security_group.sg-dev-dmz-ap-bst.id]
  tags = merge(
    {
      Name = "${var.ec2-dev-dmz-bst-name}-ENI"
    },
    var.tags-common
  )
}

resource "aws_ebs_volume" "ebs-dev-dmz-ec2-bst-1" {
  availability_zone = data.aws_availability_zones.all.names[0]
  size              = 20
  type              = "gp3"
  encrypted         = true
  kms_key_id        = var.key-cmk-ebs-arn
  tags = merge(
    {
      Name    = "${var.ec2-dev-dmz-bst-name}-DATA-1"
      KMSType = "CMK-EBS"
      Purpose = "Test"
    },
    var.tags-common
  )
}

resource "aws_volume_attachment" "ebs-att-dev-dmz-ec2-bst-1" {
  volume_id   = aws_ebs_volume.ebs-dev-dmz-ec2-bst-1.id
  instance_id = aws_instance.ec2-dev-dmz-bastion.id
  device_name = "/dev/sdb"
}


### EIP ###
resource "aws_eip" "eip-ec2-dev-dmz-bst-1" {
  vpc = true

  tags = merge(
    {
      Name    = "SNBX-AN2-DEV-DMZ-EIP-BST"
      Purpose = "Test"
    },
    var.tags-common
  )
}

resource "aws_eip_association" "eip-ec2-dev-dmz-bst-1" {
  allocation_id        = aws_eip.eip-ec2-dev-dmz-bst-1.id
  network_interface_id = aws_network_interface.eni-dev-dmz-bst-1.id
}

output "eni-ec2-dev-dmz-bst-1" {
  value = aws_eip.eip-ec2-dev-dmz-bst-1.id
}