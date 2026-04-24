# Lab 01 - Infraestructura como Codigo

Tenemos código de una aplicación web. Se compone por un archivo HTML que tiene como contenido: WEB01

Quiero poder publicar esta web, especificamente una sola copia como primera instancia

TAREA:

Desplegar dos web, mostrar Web01, y Web02 como contenido
Los puertos deben estar configurados en 4001 y 4002
Gestionar carpetas para orden
Hacer uso de Gitflow/Conventional Commits

## Requisitos

- Docker
- Terraform

## Replicar el proyecto

### 1. Construir imagenes

```bash
docker compose build
```

### 2. Desplegar infraestructura con Terraform

Asegurarse de tener `iac/terraform.tfvars` (caso contrario, crearlo) y que contenga:

```hcl
api_port = {
  default = 2001
  dev     = 4002
  qa      = 5002
}

web_port = {
  default = 2000
  dev     = 4001
  qa      = 5001
}

bd_port = {
  default = 15432
  dev     = 4003
  qa      = 5003
}
```

```bash
cd iac
terraform init
terraform apply
```

> Por defecto usa el workspace `default` (puertos: web 2000, api 2001, bd 15432).
> Para usar otro entorno:

- Creamos los entornos de trabajo con:

```bash
terraform workspace new dev
terraform workspace new qa
```

- Se seleccionan con los siguientes comandos antes de hacer el `terraform apply`:

```bash
terraform workspace select dev
terraform workspace select qa
```

### 3. Verificar contenedores y redes

```bash
docker ps
docker network inspect front-default
docker network inspect back-default
```

### Puertos por workspace

| Servicio | default | dev  | qa   |
| -------- | ------- | ---- | ---- |
| web      | 2000    | 4001 | 5001 |
| api      | 2001    | 4002 | 5002 |
| bd       | 15432   | 4003 | 5003 |
