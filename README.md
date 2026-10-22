Repositorio Base de Despliegue

\## Seguridad SSL con Certbot y Let's Encrypt



\### Requisitos

\- Un servidor Linux con Nginx instalado.

\- Un nombre de dominio público.

\- El DNS del dominio apuntando a la IP pública del servidor.

\- Los puertos TCP 80 y 443 accesibles desde Internet.



Nota: app.miempresa.local es un nombre de dominio local.

Let's Encrypt no emite certificados públicos para nombres .local.

Para obtener un certificado válido, se debe utilizar un dominio

público propio, por ejemplo, app.midominio.com.



\### Pasos de instalación en Ubuntu



1\. Instalar Nginx:

&#x20;  sudo apt update

&#x20;  sudo apt install nginx



2\. Instalar Certbot y el complemento de Nginx:

&#x20;  sudo apt install certbot python3-certbot-nginx



3\. Configurar el DNS del dominio público para que apunte al servidor.



4\. Solicitar el certificado:

sudo certbot --nginx -d app.midominio.com



5\. Comprobar la renovación automática:

&#x20;  sudo certbot renew --dry-run



6\. Verificar que el sitio funcione mediante HTTPS:

&#x20;  https://app.midominio.com

