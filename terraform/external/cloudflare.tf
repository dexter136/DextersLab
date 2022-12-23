data "cloudflare_zone" "dexter_sbs" {
  name = "dex136.xyz"
}

data "cloudflare_api_token_permission_groups" "all" {}

data "http" "public_ipv4" {
  url = "https://ipv4.icanhazip.com"
}

# data "http" "public_ipv6" {
#   url = "https://ipv6.icanhazip.com"
# }

locals {
  public_ips = [
    "${chomp(data.http.public_ipv4.body)}/32",
    # "${chomp(data.http.public_ipv6.body)}/128"
  ]
}

resource "cloudflare_filter" "countries" {
  zone_id     = data.cloudflare_zone.dexter_sbs.id
  description = "Expression to block all countries except US and CA"
  expression  = "(ip.geoip.country ne \"US\" and ip.geoip.country ne \"CA\")"
}

resource "cloudflare_firewall_rule" "countries" {
  zone_id     = data.cloudflare_zone.dexter_sbs.id
  description = "Firewall rule to block all countries except US and CA"
  filter_id   = cloudflare_filter.countries.id
  action      = "block"
}

resource "cloudflare_filter" "bots" {
  zone_id     = data.cloudflare_zone.dexter_sbs.id
  description = "Expression to block bots determined by CF"
  expression  = "(cf.client.bot)"
}

resource "cloudflare_firewall_rule" "bots" {
  zone_id     = data.cloudflare_zone.dexter_sbs.id
  description = "Firewall rule to block bots determined by CF"
  filter_id   = cloudflare_filter.bots.id
  action      = "block"
}

resource "cloudflare_filter" "threats" {
  zone_id     = data.cloudflare_zone.dexter_sbs.id
  description = "Expression to block medium threats"
  expression  = "(cf.threat_score gt 14)"
}

resource "cloudflare_firewall_rule" "threats" {
  zone_id     = data.cloudflare_zone.dexter_sbs.id
  description = "Firewall rule to block medium threats"
  filter_id   = cloudflare_filter.threats.id
  action      = "block"
}
