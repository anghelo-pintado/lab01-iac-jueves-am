# Start a container
resource "docker_container" "bd" {
  name  = "bd-${terraform.workspace}"
  image = ""

  ports {
    internal = 5432
    external = var.bd_port[terraform.workspace]
  }
}
