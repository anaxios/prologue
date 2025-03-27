terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  registry_auth {
    address = "registry-1.docker.io"
    # username = "someuser"
    # password = "somepass"
  }
}

resource "docker_registry_image" "scrinium" {
  name          = docker_image.scrinium.name
  keep_remotely = true
}

resource "docker_image" "scrinium" {
  name = "scrinium"
  build {
    context = "."
    tag     = ["anaxios/scrinium:latest"]
    triggers = {
      dir_sha1 = sha1(join("", [for f in fileset(path.module, "src/*") : filesha1(f)]))
    }
    # build_arg = {
    #   foo : "zoo"
    # }
    # label = {
    #   author : "zoo"
    # }
  }
}

variable "DOCKER_REGISTRY_USER" {

}

variable "DOCKER_REGISTRY_PASS" {

}
