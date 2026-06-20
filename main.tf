module "rg_dev" {

  source = "./modules/rg"

  resource_group_name = "rg-dev-001"

  location = "Central India"

}

module "rg_test" {

  source = "./modules/rg"

  resource_group_name = "rg-test-001"

  location = "Central India"

}

module "rg_prod" {

  source = "./modules/rg"

  resource_group_name = "rg-prod-001"

  location = "Central India"

}
module "rg_prod_002" {

  source = "./modules/rg"

  resource_group_name = "rg-prod-00w"

  location = "Central India"

}