# Lab 01 - Infraestructura como Codigo

Tenemos código de una aplicación web. Se compone por un archivo HTML que tiene como contenido: WEB01

Quiero poder publicar esta web, especificamente una sola copia como primera instancia

TAREA:

Desplegar dos web, mostrar Web01, y Web02 como contenido
Los puertos deben estar configurados en 4000 y 4001
Gestionar carpetas para orden
Hacer uso de Gitflow/Conventional Commits

## Arquitectura implementada

El proyecto define 2 servicios en Docker Compose:

- web01
	- Build desde src/web01
	- Publica el puerto 4001 del host hacia el puerto 80 del contenedor
	- Sirve una pagina HTML con el texto WEB 01

- web02
	- Build desde src/web02
	- Publica el puerto 4002 del host hacia el puerto 80 del contenedor
	- Sirve una pagina HTML con el texto WEB 02

## Estructura del proyecto

		.
		├── docker-compose.yml
		├── README.md
		└── src
				├── web01
				│   ├── Dockerfile
				│   └── index.html
				└── web02
						├── Dockerfile
						└── index.html

## Explicacion de los archivos clave

### docker-compose.yml

Define los servicios web01 y web02, sus contextos de build y el mapeo de puertos:

- 4001:80 para web01
- 4002:80 para web02

### Dockerfile de cada servicio

Ambos Dockerfile:

- Usan la imagen base nginx:stable-alpine3.23-perl.
- Copian su index.html a /usr/share/nginx/html/index.html.
- Exponen el puerto 80 dentro del contenedor.

### index.html

- src/web01/index.html muestra WEB 01.
- src/web02/index.html muestra WEB 02.

## Requisitos

- Docker instalado.
- Docker Compose disponible (plugin docker compose).

Verificacion rapida:

		docker --version
		docker compose version

## Como levantar el proyecto

Desde la raiz del repositorio:

1. Construir y levantar servicios:

			 docker compose up --build -d

2. Verificar contenedores en ejecucion:

			 docker compose ps

3. Probar en navegador:

	 - http://localhost:4001  -> WEB 01
	 - http://localhost:4002  -> WEB 02

## Resultado esperado

- Al abrir http://localhost:4001 se visualiza WEB 01.
- Al abrir http://localhost:4002 se visualiza WEB 02.
- Ambos servicios quedan gestionados desde un unico docker-compose.yml.
# lab01-iac-jueves-am
