# Como buena practica se debe indicar explicitamente la version de la imagen para evitar que se 
# use una version mas reciente de la imagen base y esta tenga cambios que puedan afectar el funcionamiento de 
# nuestra imagen personalizada.
FROM nginx:stable-alpine3.23-perl 

# Copiamos el archivo index.html personalizado a la ruta donde nginx lo espera
COPY index.html /usr/share/nginx/html/index.html

# Exponemos el puerto 80 para que el servidor web sea accesible desde fuera del contenedor
EXPOSE 80