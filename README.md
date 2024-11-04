# BlockbusterAPI

## Bienvenidos a BlockbusterAPI, el servicio que tu app necesita!

### Requerimientos NO Funcionales OBLIGATORIOS

Se adjunta documentación de los endpoints generados. Para entender cómo consumir nuestra API, brindamos algunos ejemplos.

### Notas

- Las verificaciones de parámetros y de sus valores se hacen en el controlador, en donde para ser utilizados, deben escribirse correctamente, de lo contrario no se tomaran en cuenta para ninguna petición.
- Parámetro GET o valor incorrecto, listará películas sin orden, sin filtro o sin paginar.
- Podrán combinarse el orden, el filtro y el paginado de búsqueda ya que la consulta sql se genera de forma dinámica.
- En la inserción de un item, para la carga de imágenes, se debe cargar un path ficticio, ya que tanto la db como el controlador toman el dato como obligatorio.

### Requerimientos Funcionales Mínimos

#### 1. La API Rest debe ser RESTful

Diseñamos los endpoints partiendo del recurso para mantener una interfaz unificada.  
Para ejemplificar adjuntamos la tabla de ruteo en la que se muestra recurso, verbo, controlador y metodo:

- 'movies', 'GET', 'MovieApiController', 'getMovies'
- 'movies/:id', 'GET', 'MovieApiController', 'getMovieById'
- 'movies', 'POST', 'MovieApiController', 'addMovie'
- 'movies/:id', 'PUT', 'MovieApiController', 'updateMovie'
- 'movies/:id', 'DELETE', 'MovieApiController', 'deleteMovie'

#### 2. Debe tener al menos un servicio que liste (GET) una colección entera de entidades

Para obtener la colección completa de items debe utilizarse el verbo GET a travéz del siguiete endpoint:

- localhost/tudai.web2.tpeApi/api/movies

Se recibirá un arreglo de objetos JSON como el siguiente ejemplo:

- [
  {
  "id_movie": 1011,
  "title": "Pelicula prueba 11",
  "poster_path": "images/movies/imagenPrueba11.jpg",
  "release_date": "2025-10-29",
  "overview": "Carga de datos de películas de prueba",
  "company": "Unicen",
  "main_genre": "ciencia ficción"
  },
  {
  "id_movie": 1012,
  "title": "Pelicula prueba 12",
  "poster_path": "images/movies/imagenPrueba12.jpg",
  "release_date": "2025-10-30",
  "overview": "Carga de datos de películas de prueba",
  "company": "Exactas",
  "main_genre": "fantasia"
  }
  ]

#### 3. El servicio que lista una colección entera debe poder ordenarse opcionalmente por al menos un campo de la tabla, de manera ascendente o descendente.

Para ordenar una busqueda debemos elegir un campo y un criterio de orden.  
Los campos pueden ser "id_movie", "title", "release_date", "company", y "genre". El criterio será "asc" (ascendente) o "desc" (descendente).  
Por carecer de sentido, no se podrá ordenar por "overview" ni "poster_path".  
Realizamos la petición mediante el verbo GET a travéz del siguiente endpoint:

- localhost/tudai.web2.tpeApi/api/movies?order=`campo seleccionado`&orderValue=`criterio de orden`
- localhost/tudai.web2.tpeApi/api/movies?order=id_movie&orderValue=desc (ejemplo)

#### 4. Debe tener al menos un servicio que obtenga (GET) una entidad determinada por su ID.

Para buscar una entidad a travéz de su id, necesitamos saber el id del item solicitado.
Realizamos la petición mediante el verbo GET a travéz del siguiente endpoint:

- localhost/tudai.web2.tpeApi/api/movies/:id
- localhost/tudai.web2.tpeApi/api/movies/519182 (ejemplo)

Se recibirá un objeto JSON como el siguiente:

- {
  "id_movie": 1012,  
  "title": "Pelicula prueba 12",  
  "poster_path": "images/movies/imagenPrueba12.jpg",  
  "release_date": "2025-10-30",  
  "overview": "Carga de datos de películas de prueba",  
  "company": "Exactas",  
  "main_genre": "fantasia"  
  }

#### 5. Debe tener al menos un servicio para agregar y otro para modificar datos (POST y PUT).

Para agregar o modificar un item se debe utilizar el verbo POST o PUT respectivamente a travéz del siguente endpoint:

- localhost/tudai.web2.tpeApi/api/movies

Para la inserción de un item, deben estar presentes todos los atributos del mismo ya que son obligatorios, con exepción de "id_movie" por ser autoincremental en la db. En cuanto a la modificación, el atributo "id_movie" no podrá modificarse y no es necesario completar todos, ya que solo serán modificados los atributos presentes en la petición.  
Ejemplo de formato para carga o modificación de item:

{
"title": "Pelicula prueba 12",  
"poster_path": "images/movies/imagenPrueba12.jpg",  
"release_date": "2025-10-30",  
"overview": "Carga de datos de películas de prueba",  
"company": "Exactas",  
"main_genre": "fantasia"  
}

#### 6. La API Rest debe manejar de manera adecuada al menos los siguientes códigos de error (200, 201, 400 y 404)

Los siguientes códigos de respuesta estarán presentes en:

- 200 OK: La solicitud se ha completado con éxito y se devuelve una lista de elementos o un elemento individual.
- 201 Created: Se ha creado o modificado un elemento correctamente.
- 400 Bad Request: La solicitud contiene datos inválidos o incompletos.
- 404 Not Found: No se ha encontrado la lista o el elemento solicitado.
- 500 Internal Server Error: Ha ocurrido un error interno en la inserción o modificación de un item.

#### 7. El servicio que obtiene una colección entera debe poder paginar.

Para solicitar una busqueda paginada debemos ingresar la página y la cantidad deseada de elementos a mostrar.
Realizamos la petición mediante el verbo GET a travéz del siguiente endpoint:

- localhost/tudai.web2.tpeApi/api/movies?page=`página a visualizar`&limit=`cantidad de items por página`
- localhost/tudai.web2.tpeApi/api/movies?page=2&limit=3 (ejemplo)

#### 8. El servicio que obtiene una colección entera debe poder filtrarse por alguno de sus campos.

Para filtrar la colección elegimos el campo "main_genre", de este modo permite filtrar la busqueda por género de película.  
Los géneros pueden ser "aventura", "fantasia", "animación", "drama", "terror", "acción", "comedia", "suspenso", "crimen", "ciencia ficción", "romance", "familia".  
Realizamos la petición mediante el verbo GET a travéz del siguiente endpoint:

- localhost/tudai.web2.tpeApi/api/movies?filter=`campo a filtrar`&value=`género`
- localhost/tudai.web2.tpeApi/api/movies?filter=main_genre&value=terror (ejemplo)

#### 9. El servicio que obtiene una colección entera debe poder ordenarse por cualquiera de los campos de la tabla de manera ascendente o descendente. (A diferencia del obligatorio que es solo por un campo a elección).

Este punto se detalla en el item 3.

#### 10. El servicio debe requerir un token para realizar modificaciones (PUT, POST).
