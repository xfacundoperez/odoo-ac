# Pasos a seguir para instalar sistema Odoo (v13)

Ejecutar los comandos: 
1.	git clone git@github.com:xfacundoperez/odoo-ac.git
2.	bash ~/odoo-ac/repos.sh
3.	docker compose up –d

Con esto queda funcionando el sistema con HTTP (sin SSL) para inicializar la web desde la IP o URL que se asigne.
Los pasos a seguir serian obtener el certificado para guardar dentro de “odoo-ac/proxy/ssl” y habilitar el sitio “odoo-ac/proxy/conf.d/ssl.conf.disabled” (deshabilitando el sitio no-ssl.conf)
Asignar el nombre de dominio que se requiera para que el proxy atienda las peticiones a través de *.example.com (cada sub dominio es una base de datos diferente)
Para algunas configuraciones de filtro de base de datos, adicionales de módulos y demás se requiere acceso por SSH para clonar el repositorio y configurar si es necesario el sistema.
