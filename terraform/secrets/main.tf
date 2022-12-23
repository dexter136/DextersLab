resource "kubernetes_secret" "discord-secret" {
  metadata {
    name      = "discord-secret"
    namespace = "monitoring-system"
  }

  data = {
    "DISCORD_WEBHOOK" = var.DISCORD_WEBHOOK
  }
}

resource "kubernetes_secret" "unpackerr-env" {
  metadata {
    name      = "unpackerr-env"
    namespace = "media"
  }

  data = {
    "UN_SONARR_0_API_KEY" = var.UN_SONARR_0_API_KEY
    "UN_RADARR_0_API_KEY" = var.UN_RADARR_0_API_KEY
    "UN_LIDARR_0_API_KEY" = var.UN_LIDARR_0_API_KEY
  }
}

resource "kubernetes_secret" "gitea-admin" {
  metadata {
    name      = "gitea-admin-secret"
    namespace = "gitea"
  }

  data = {
    "username" = "dexter136"
    "password" = var.gitea_password
    "email"    = "sean@dex136.xyz"
  }
}

resource "kubernetes_secret" "ddns-token" {
  metadata {
    name      = "ddns-token"
    namespace = "cron-jobs"
  }

  data = {
    "KEY"     = var.cloudflare_key
    "RECORD"  = var.cloudflare_record_id
    "ZONE"    = var.cloudflare_zone_id
    "NAME"    = var.cloudflare_name
    "KEY2"    = var.cloudflare_key2
    "NAME2"   = var.cloudflare_name2
    "RECORD2" = var.cloudflare_record_id2
    "ZONE2"   = var.cloudflare_zone_id2
  }
}

resource "kubernetes_secret" "renovate-env" {
  metadata {
    name      = "renovate-env"
    namespace = "renovate"
  }

  data = {
    "GITHUB_COM_TOKEN"      = var.renovate_gh_token
    "RENOVATE_AUTODISCOVER" = "false"
    "RENOVATE_PLATFORM"     = "gitea"
    "RENOVATE_ENDPOINT"     = "https://git.dex136.xyz/api/v1"
    "RENOVATE_GIT_AUTHOR"   = "Renovate Bot <bot@renovateapp.com>"
    "RENOVATE_TOKEN"        = var.renovate_token
  }
}

resource "kubernetes_secret" "podcastdownload" {
  metadata {
    name      = "podcastdownload-secret"
    namespace = "media"
  }

  data = {
    "PODCAST_0"  = var.PODCAST_0
    "PODCAST_1"  = var.PODCAST_1
    "PODCAST_2"  = var.PODCAST_2
    "FILEPATH_0" = var.FILEPATH_0
    "FILEPATH_1" = var.FILEPATH_1
    "FILEPATH_2" = var.FILEPATH_2
  }
}
