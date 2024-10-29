## Requerimientos Funcionales Mínimos
1 - `La API Rest debe ser RESTful`
2 - `Debe tener al menos un servicio que liste (GET) una colección entera de entidades.`
3 - `El servicio que lista una colección entera debe poder ordenarse opcionalmente por al menos un campo de la tabla, de manera ascendente o descendente.`
4 - `Debe tener al menos un servicio que obtenga (GET) una entidad determinada por su ID.`
5 - Debe tener al menos un servicio para agregar y otro para modificar datos (POST y PUT)
6 - La API Rest debe manejar de manera adecuada al menos los siguientes códigos de error (200, 201, 400 y 404)
7 - El servicio que obtiene una colección entera debe poder paginar.
8 - El servicio que obtiene una colección entera debe poder filtrarse por alguno de sus campos.
9 - El servicio que obtiene una colección entera debe poder ordenarse por cualquiera de los campos de la tabla de manera ascendente o descendente. (A diferencia del obligatorio que es solo por un campo a elección). 
10 - El servicio debe requerir un token para realizar modificaciones (PUT, POST)

## Requerimientos NO Funcionales OBLIGATORIOS
Se debe adjuntar documentación de los endpoints generados en el README.md del repositorio. Es decir, una descripción de cada endpoint, cómo se usan y ejemplos. Entender que esta documentación la va a leer otro desarrollador para entender cómo se consume la API.
