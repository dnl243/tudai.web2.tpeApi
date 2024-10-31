### Requerimientos Funcionales Mínimos
1 - `La API Rest debe ser RESTful.`   
2 - `Debe tener al menos un servicio que liste (GET) una colección entera de entidades.`   
3 - `El servicio que lista una colección entera debe poder ordenarse opcionalmente por al menos un campo de la tabla, de manera ascendente o descendente.`   
4 - `Debe tener al menos un servicio que obtenga (GET) una entidad determinada por su ID.`   
5 - `Debe tener al menos un servicio para agregar y otro para modificar datos (POST y PUT).`   
6 - `La API Rest debe manejar de manera adecuada al menos los siguientes códigos de error (200, 201, 400 y 404).`   
7 - `El servicio que obtiene una colección entera debe poder paginar.`   
8 - `El servicio que obtiene una colección entera debe poder filtrarse por alguno de sus campos.`   
9 - `El servicio que obtiene una colección entera debe poder ordenarse por cualquiera de los campos de la tabla de manera ascendente o descendente. (A diferencia del obligatorio que es solo por un campo a elección).`    
10 - El servicio debe requerir un token para realizar modificaciones (PUT, POST).   

### Requerimientos NO Funcionales OBLIGATORIOS
Se debe adjuntar documentación de los endpoints generados en el README.md del repositorio. Es decir, una descripción de cada endpoint, cómo se usan y ejemplos. Entender que esta documentación la va a leer otro desarrollador para entender cómo se consume la API.

### Notas
=> Parámetro GET = incorrecto => listará películas sin orden, sin filtro o sin paginar.   
=> Podrán combinarse el orden, el filtrado y el paginado de busqueda ya que la consulta sql se genera de forma dinámica.
=> Por carecer de sentido, no se podrá ordenar por overview ni poster_path.   
=> En la inserción de un item, para la carga de imágenes, se debe cargar un path ficticio, ya que tanto la db como el controller toman el dato como obligatorio.

### Ejemplo de Item 
- {
    "id_movie": 131,   
    "title": "Pelicula prueba 11",   
    "poster_path": "images/movies/imagenPrueba11.jpg",   
    "release_date": "2025-10-29",   
    "overview": "Carga de datos de películas de prueba",   
    "company": "Unicen",   
    "main_genre": "ciencia ficción"   
  }

### 1.tabla de ruteo
-  url                =>  resource  =>  verb  =>  controller          =>  method       
-  api/movies         =>  movies    =>  get   =>  MovieApiController  =>  getMovies       
-  api/movies/:id     =>  movies    =>  get   =>  MovieApiController  =>  getMovieById       
-  api/movies         =>  movies    =>  post  =>  MovieApiController  =>  addMovie       
-  api/movies/:id     =>  movies    =>  put   =>  MovieApiController  =>  updateMovie       

### 2.lista de películas (GET)
-  localhost/tudai.web2.tpeApi/api/movies

### 3. y 9.lista de películas según orden elegido (GET)
=> parámetro GET = correcto => valor = incorrecto => orden ascendente por defecto,   
=> parámetro GET = correcto => valor = correcto => orden seleccionado.
- localhost/tudai.web2.tpeApi/api/movies?orderById=asc
- localhost/tudai.web2.tpeApi/api/movies?orderById=desc
- localhost/tudai.web2.tpeApi/api/movies?orderByTitle=asc
- localhost/tudai.web2.tpeApi/api/movies?orderByTitle=desc
- localhost/tudai.web2.tpeApi/api/movies?orderByRelease=asc
- localhost/tudai.web2.tpeApi/api/movies?orderByRelease=desc
- localhost/tudai.web2.tpeApi/api/movies?orderByCompany=asc
- localhost/tudai.web2.tpeApi/api/movies?orderByCompany=desc
- localhost/tudai.web2.tpeApi/api/movies?orderByGenre=asc
- localhost/tudai.web2.tpeApi/api/movies?orderByGenre=desc

### 4.película por id (GET)
-  localhost/tudai.web2.tpeApi/api/movies/:id
-  localhost/tudai.web2.tpeApi/api/movies/519182 (ejemplo)

### 5.insertar una película (POST)
- localhost/tudai.web2.tpeApi/api/movies

### 6.codigos de error
- 200 => respuesta con éxito de petición de lista o item
- 201 => creación o modificación con éxito de un item
- 400 => datos incompletos o erróneos en creación o modificación de item
- 404 => lista o item no encontrado

### 7.paginado (GET)
- localhost/tudai.web2.tpeApi/api/movies?page=`página a visualizar`&limit=`cantidad de items por página`   
- localhost/tudai.web2.tpeApi/api/movies?page=2&limit=3 (ejemplo)

### 8.lista de películas según categoría (GET)
=> parámetro GET = correcto => valor = incorrecto => listará películas sin filtro,   
=> parámetro GET = correcto => valor = correcto => filtro seleccionado. 
- localhost/tudai.web2.tpeApi/api/movies?filterByGenre=aventura
- localhost/tudai.web2.tpeApi/api/movies?filterByGenre=fantasia
- localhost/tudai.web2.tpeApi/api/movies?filterByGenre=animación
- localhost/tudai.web2.tpeApi/api/movies?filterByGenre=drama
- localhost/tudai.web2.tpeApi/api/movies?filterByGenre=terror
- localhost/tudai.web2.tpeApi/api/movies?filterByGenre=acción
- localhost/tudai.web2.tpeApi/api/movies?filterByGenre=comedia
- localhost/tudai.web2.tpeApi/api/movies?filterByGenre=suspenso
- localhost/tudai.web2.tpeApi/api/movies?filterByGenre=crimen
- localhost/tudai.web2.tpeApi/api/movies?filterByGenre=ciencia%20ficción
- localhost/tudai.web2.tpeApi/api/movies?filterByGenre=romance
- localhost/tudai.web2.tpeApi/api/movies?filterByGenre=familia