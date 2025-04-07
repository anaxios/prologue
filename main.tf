# terraform {
#   required_providers {
#     docker = {
#       source  = "kreuzwerker/docker"
#       version = "3.0.2"
#     }
#   }
# }

# terraform {
#   backend "remote" {
#     # The name of your Terraform Cloud organization.
#     organization = "september"

#     # The name of the Terraform Cloud workspace to store Terraform state files in.
#     workspaces {
#       name = "scrinium"
#     }
#   }
# }

# provider "docker" {
#   host     = "ssh://bob@104.245.107.143:22"
#   ssh_opts = ["-i", "", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null"]
#   # registry_auth {
#   #   address = "registry-1.docker.io"
#   #   # username = "someuser"
#   #   # password = "somepass"
#   # }
# }

# resource "docker_registry_image" "scrinium" {
#   name          = "anaxios/scrinium"
#   keep_remotely = true
# }

# resource "docker_container" "scrinium" {
#   image    = docker_image.scrinium.image_id
#   name     = "scrinium"
#   hostname = "scrinium"
#   restart  = "unless-stopped"

#   networks_advanced {
#     name = "proxy"
#   }

#   labels {
#     label = "traefik.enable"
#     value = "true"
#   }

#   labels {
#     label = "traefik.http.middlewares.gzip.compress"
#     value = "true"
#   }

#   labels {
#     label = "traefik.http.routers.${var.service-name}.rule"
#     value = "Host(`daedalist.net`) && PathPrefix(`/`)"
#   }

#   labels {
#     label = "traefik.http.routers.${var.service-name}.entrypoints"
#     value = "websecure"
#   }

#   labels {
#     label = "traefik.http.routers.${var.service-name}.tls.certresolver"
#     value = "myresolver"
#   }

#   labels {
#     label = "traefik.http.routers.${var.service-name}.service"
#     value = var.service-name
#   }

#   labels {
#     label = "traefik.http.routers.${var.service-name}.middlewares"
#     value = "gzip"

#   }

#   labels {
#     label = "traefik.http.services.${var.service-name}.loadbalancer.server.port"
#     value = var.traefik-service-port

#   }

#   labels {
#     label = "traefik.docker.network"
#     value = "proxy"
#   }

#   variable "service-name" {
#     default = "scrinium"
#     type    = string
#   }

#   variable "traefik-service-port" {
#     default = 3000
#     type    = number
#   }

#   # labels {
#   #   label = "traefik.http.routers.dozzle.middlewares"
#   #   value = "authelia@docker"
#   # }

# }

# # resource "docker_image" "scrinium" {
# #   name = "scrinium"
# #   build {
# #     context = "."
# #     tag     = ["anaxios/scrinium:latest"]
# #     # triggers = {
# #     #   dir_sha1 = sha1(join("", [for f in fileset(path.module, "src/*") : filesha1(f)]))
# #     # }
# #     # build_arg = {
# #     #   foo : "zoo"
# #     # }
# #     # label = {
# #     #   author : "zoo"
# #     # }
# #   }
# # }

# # variable "DOCKER_REGISTRY_USER" {
# #   sensitive = true
# # }

# # variable "DOCKER_REGISTRY_PASS" {
# #   sensitive = true
# # }
