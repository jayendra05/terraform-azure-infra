resource "azurerm_lb" "this" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                          = "frontend"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_lb_backend_address_pool" "this" {
  name            = "backend-pool"
  loadbalancer_id = azurerm_lb.this.id
}

resource "azurerm_lb_probe" "this" {
  for_each = {
    for rule in var.lb_rules :
    rule.name => rule
  }

  name            = "${each.value.name}-probe"
  loadbalancer_id = azurerm_lb.this.id
  protocol        = "Tcp"
  port            = each.value.port
}

resource "azurerm_lb_rule" "this" {
  for_each = {
    for rule in var.lb_rules :
    rule.name => rule
  }

  name                           = each.value.name
  loadbalancer_id                = azurerm_lb.this.id
  protocol                       = "Tcp"
  frontend_port                  = each.value.port
  backend_port                   = each.value.port
  frontend_ip_configuration_name = azurerm_lb.this.frontend_ip_configuration[0].name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.this.id]
  probe_id                       = azurerm_lb_probe.this[each.key].id
}
