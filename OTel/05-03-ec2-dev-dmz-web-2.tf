resource "aws_instance" "ec2-dev-dmz-web-2" {
  ami               = data.aws_ami.amlx2.id
  instance_type     = "t2.micro"
  availability_zone = data.aws_availability_zones.all.names[var.az-3-number]
  # ebs_optimized     = true

  #운영단계중에는 true로 변경
  disable_api_termination = false

  iam_instance_profile = aws_iam_role.role-dev-ec2-default.name

  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 3
    #운영단계중에는 required
    http_tokens = "required"
  }

  network_interface {
    network_interface_id = aws_network_interface.eni-dev-dmz-ec2-web-2.id
    device_index         = 0
  }

  user_data = filebase64("./userdata-ec2-default.sh")

  root_block_device {
    volume_type           = "gp3"
    volume_size           = 8
    delete_on_termination = true

    tags = merge(
      {
        Name = "${var.ec2-dev-dmz-web-2-name}-ROOT"
      },
      var.tags-josh-default
    )
  }

  # ebs_block_device {
  #   device_name           = "/dev/sdb"
  #   volume_type           = "gp3"
  #   volume_size           = 20
  #   delete_on_termination = true
  #   tags = merge(
  #     {
  #       Name = "${var.ec2-dev-dmz-web-2-name}-DATA"
  #     },
  #     var.tags-josh-default
  #   )
  # }

  tags = merge(
    {
      Name = var.ec2-dev-dmz-web-2-name
    },
    var.tags-josh-default
  )

}

resource "aws_network_interface" "eni-dev-dmz-ec2-web-2" {
  subnet_id   = aws_subnet.sbn-dev-dmz-ap-2.id
  private_ips = [var.ec2-dev-dmz-web-2-ip]
  security_groups = [
    aws_security_group.sg-dev-dmz-ap-mgd-1.id
  ]
  tags = merge(
    {
      Name = "${var.ec2-dev-dmz-web-2-name}-ENI"
    },
    var.tags-josh-default
  )
}


