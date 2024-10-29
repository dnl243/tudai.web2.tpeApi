## Requerimientos Funcionales Mínimos
1 - `La API Rest debe ser RESTful`   
2 - `Debe tener al menos un servicio que liste (GET) una colección entera de entidades.`   
3 - `El servicio que lista una colección entera debe poder ordenarse opcionalmente por al menos un campo de la tabla, de manera ascendente o descendente.`   
4 - `Debe tener al menos un servicio que obtenga (GET) una entidad determinada por su ID.`   
5 - Debe tener al menos un servicio para agregar y otro para modificar datos (POST y PUT)   
6 - La API Rest debe manejar de manera adecuada al menos los siguientes códigos de error (200, 201, 400 y 404)   
7 - El servicio que obtiene una colección entera debe poder paginar.   
8 - `El servicio que obtiene una colección entera debe poder filtrarse por alguno de sus campos.`   
9 - `El servicio que obtiene una colección entera debe poder ordenarse por cualquiera de los campos de la tabla de manera ascendente o descendente. (A diferencia del obligatorio que es solo por un campo a elección).`    
10 - El servicio debe requerir un token para realizar modificaciones (PUT, POST)   

## Requerimientos NO Funcionales OBLIGATORIOS
Se debe adjuntar documentación de los endpoints generados en el README.md del repositorio. Es decir, una descripción de cada endpoint, cómo se usan y ejemplos. Entender que esta documentación la va a leer otro desarrollador para entender cómo se consume la API.


### TABLA DE RUTEO
-  url                              resource    verb    controller            method
-  ---                              --------    ----    ----------            ------

-  --- lista de películas ---
-  https://localhost/tudai.web2.tpeApi/api/movies
-  api/movies                       movies      get     MovieApiController    getMovies

-  --- lista de películas según orden elegido ---
-  parámetro GET = incorrecto => películas sin orden,
-  parámetro GET = correcto => valor = incorrecto => orden ascendente por defecto,
-  parámetro GET = correcto => valor = correcto => orden seleccionado
-  api/movies?orderById=asc         movies      get     MovieApiController    getMovies
-  api/movies?orderById=desc        movies      get     MovieApiController    getMovies
-  api/movies?orderByTitle=asc      movies      get     MovieApiController    getMovies
-  api/movies?orderByTitle=desc     movies      get     MovieApiController    getMovies
-  api/movies?orderByRelease=asc    movies      get     MovieApiController    getMovies
-  api/movies?orderByRelease=desc   movies      get     MovieApiController    getMovies
-  api/movies?orderByCompany=asc    movies      get     MovieApiController    getMovies
-  api/movies?orderByCompany=desc   movies      get     MovieApiController    getMovies
-  api/movies?orderByGenre=asc      movies      get     MovieApiController    getMovies
-  api/movies?orderByGenre=desc     movies      get     MovieApiController    getMovies

- --- lista de películas según categoría ---
- api/movies?filterByGenre=aventura
- api/movies?filterByGenre=fantasia
- api/movies?filterByGenre=animación
- api/movies?filterByGenre=drama
- api/movies?filterByGenre=terror
- api/movies?filterByGenre=acción
- api/movies?filterByGenre=comedia
- api/movies?filterByGenre=suspenso
- api/movies?filterByGenre=crimen
- api/movies?filterByGenre=ciencia%20ficción
- api/movies?filterByGenre=romance
- api/movies?filterByGenre=familia