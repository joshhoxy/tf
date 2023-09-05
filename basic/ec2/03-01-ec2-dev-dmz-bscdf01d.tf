resource "aws_instance" "ec2-dev-dmz-bst-1" {
  ami               = var.ami-amlx3
  instance_type     = "t2.micro"
  availability_zone = var.az-a
  ebs_optimized     = true

  #운영단계중에는 true로 변경
  disable_api_termination = false

  iam_instance_profile = aws_iam_role.role-dev-ec2-default.name

  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 1
    #운영단계중에는 required
    http_tokens = "optional"
  }

  network_interface {
    network_interface_id = aws_network_interface.eni-dev-dmz-ec2-bst-1.id
    device_index         = 0
  }

  user_data = "./userdata-ec2-default.sh"

  root_block_device {
    volume_type           = "gp3"
    volume_size           = 100
    delete_on_termination = true

    tags = merge(
      {
        Name = "${var.ec2-dev-dmz-bst-1-name}-ENI"
      },
      var.tags-josh-test
    )
  }

  tags = merge(
    {
      Name = var.ec2-dev-dmz-bst-1-name
    },
    var.tags-josh-test
  )
}

resource "aws_ebs_volume" "ebs-dev-dmz-bst-data-1" {
  availability_zone = var.az-a
  size = 30
  tags = merge (
    {
      Name = "${var.ec2-dev-dmz-bst-1-name}-DATA"
    },
    var.tags-josh-test
  )
}


resource "aws_volume_attachment" "ebs-dev-dmz-bst-data-1-att" {
  device_name = "/dev/sdh"
  volume_id = aws_ebs_volume.ebs-dev-dmz-bst-data-1.id
  instance_id = aws_instance.ec2-dev-dmz-bst-1
}



resource "aws_network_interface" "eni-dev-dmz-ec2-bst-1" {
  subnet_id   = aws_subnet.sbn-dev-dmz-pub-a.id
  private_ips = [var.ec2-dev-dmz-bst-1-ip]
  security_group = [
    aws_security_group.scg-dev-dmz-ec2-bst-1.id
  ]
  tags = merge(
    {
      Name = "${var.ec2-dev-dmz-bst-1-name}-ENI"
    },
    var.tags-josh-test
  )
}
