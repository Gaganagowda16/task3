terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  host = "npipe:////./pipe/docker_engine"
}
provider "docker" {
  host = "npipe:////./pipe/docker_engine"
}




resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx_container" {
  name  = "nginx-server"
  image = docker_image.nginx.name

  ports {
    internal = 80
    external = 8080
  }
}

output "container_name" {
  value = docker_container.nginx_container.name
}

output "nginx_url" {
  value = "http://localhost:8080"
}