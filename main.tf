module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  for_each = toset(["1", "2", "3"])

  name = "ec2-${each.key}"

  instance_type          = "t3.micro"
  key_name               = "key_name"
  monitoring             = true
  vpc_security_group_ids = ["sg-id"]
  subnet_id              = "subnet-id"

  tags = {
    Terraform   = "true"
    Environment = "prod"
  }
}
