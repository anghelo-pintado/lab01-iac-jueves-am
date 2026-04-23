resource "docker_network" "front" {
  name = "front-${terraform.workspace}"
}

resource "docker_network" "back" {
  name = "back-${terraform.workspace}"
}
