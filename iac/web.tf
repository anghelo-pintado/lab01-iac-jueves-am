# Start a container
resource "docker_container" "web" {
  name  = "web-${terraform.workspace}"
  image = "lab01-iac-jueves-am-web01"

  ports {
    internal = 80
    external = var.web_port[terraform.workspace]
  }
}
