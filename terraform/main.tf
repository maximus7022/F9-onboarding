module "network" {
  source              = "./modules/network"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  env                 = var.env
}

module "ec2" {
  source            = "./modules/ec2"
  instance_type     = var.instance_type
  vpc_id            = module.network.vpc_id
  public_subnet_id  = module.network.public_subnet_id
  private_subnet_id = module.network.private_subnet_id
  sg_port_list      = var.sg_port_list
  cidr_block        = var.cidr_block
  bucket_name       = module.s3.bucket_name
  env               = var.env
}

module "s3" {
  source       = "./modules/s3"
  bucket_name  = var.bucket_name
  iam_role_arn = module.ec2.iam_role_arn
}
