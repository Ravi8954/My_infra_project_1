variable "v_nets" {
  type = map(object(
    {
      v_net_name    = string
      location      = string
      rg_name       = string
      address_space = list(string)
      subnets = map(object({
        subnet_name      = string
        address_prefixes = list(string)
      }))

  }))
}

