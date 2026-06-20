module "rg_dev" {
  source = "./modules/rg"
  resource_group_name = var.rg_dev_name
  location = var.rg_dev_location
}

module "rg_prod" {
  source = "./modules/rg"
  resource_group_name = var.rg_prod_name
  location = var.rg_prod_location
}

module "rg_staging" {
  source = "./modules/rg"
  resource_group_name = var.rg_staging_name
  location = var.rg_staging_location
}

module "rg_test" {
  source = "./modules/rg"
  resource_group_name = var.rg_test_name
  location = var.rg_test_location
}