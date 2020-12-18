# Ejercicio_urbetrack

Un proyecto para la entrega a Urbetrack, por Santiago Calvi.

## Detalles

### Examen remoto para aplicar al puesto de Flutter

Realizar una aplicación y subirla a un repositorio de Github privado (que se pueda
compartir con los siguientes usuarios @franco-brusca - @rnrneverdies y @ramiro-
bugallo) o enviando un ZIP con las fuentes listas para compilar:
La aplicación requiere las siguientes vistas:
1- Pantalla de inicio “Login”
2- Home (listado)
a. Detalle
3- Navigation Drawer (menú lateral izquierdo)

Vista 1 (Login):
- Se requiere que pida:
o Nombre de usuario
o Contraseña
- El login se realizará contra un servicio local que respete la siguiente lógica:
o Se considerarán usuarios validos a todos los que utilicen como
contraseña “123456”.

- En el caso de ingresar una combinación inválida se debe informar un error por
pantalla.
- En el caso de ‘loguearse’ exitosamente se debe persistir el nombre de usuario
localmente.

Vista 2 (home):
- Se presentará un listado de imágenes que respete las siguientes reglas:
- Muestre imagen y titulo de autor.
- Implemente un mecanismo para obtener más ‘Imagenes’ (pull to
refresh por ejemplo).
- Al presionar sobre una imagen te navegue a la Vista 2a con el detalle
completo (mostrar todos los datos adjuntos al modelo).

El servicio a utilizar para realizar esta vista se maneja de la siguiente manera:
- GET https://picsum.photos/v2/list
- Si se quisiera implementar una estrategia de paginado., también se puede
utilizar siguiendo las siguientes reglas
https://picsum.photos/v2/list?page=2&amp;limit=15

Documentación en https://picsum.photos/

Vista 3 (Navigation Drawer):
- Este debe mostrar el nombre de usuario.
- Permitir cambiar entre Dark mode y Standard.
- Cerrar Sesión

### Consideraciones:
- El estilo que le quiera dar a la App es libre., Sorpréndanos!!
- Es requerido la utilización de algún tipo de State Managment (ejemplo Bloc).
- Se valorará buenas prácticas aplicadas a
- Disposición/arquitectura de la App.
- UI.
- Localización de recursos.
- Estilos.
- Manejo de errores.
- SOLID.
- Test.
- Performance.
