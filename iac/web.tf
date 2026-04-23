# Start a container
resource "docker_container" "web" {
  name  = "web-${terraform.workspace}"
  image = "lab/web01"

  ports {
    internal = 80
    external = var.web_port[terraform.workspace]
  }

  networks_advanced {
    name = docker_network.front.name
  }
}
