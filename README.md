Capas de la aplicación:

Persistencia: 
- Se trabajo en el app con objetos con el fin de otorgar una mayor fiabilidad y reusabilidad, esto se observa en la clase llamada Movie, en donde se le creo un objeto a cada película.

Vistas: 
- Se trabajos con 3 vistas, en donde la primera se busca mostrar las 3 categorías solicitadas, Upcoming, Top Rated y Popular para diferenciar a cada lista al momento de su visualización.
- Se hizo otra vista con el fin de listar todas las películas que cumplieran cada uno de los parámetros por el cual se filtro, en este caso la categoría.
- y por ultimo se hizo una vista interna para el detalle e información de cada una de las películas.

Clases creadas:

- ViewController.swift: En esta clase se desarrollo la tabla de categorías con el fin de filtrar las películas.
- CategoriesTableViewCell.swift: En esta clase se encuentran cada una de las properties para la celda utilizada en la tabla dentro de la clase viewController.swift
- MoviesListViewController.swift: En esta clase se desarrollo cada una de las consultas para consumir los servicios web, dependiendo de la categoría que se hubiera escogido em el ViewController.swift. También se desarrollo la función de búsqueda dentro de las películas cargadas.
- MoviesCollectionViewCell.swift: Esta clase se encuentra todas las properties que se utilizan dentro de la celda para el collectionview que se encuentra dentro de la clase MoviesListViewController.
- Movie.swift: esta clase se creo con el fin de crear el objeto película y poder utilizar dentro del app.
- globals.swift: clase creada con el fin de trabajar con algunas variables globales.
- MovieViewController.swift: Esta clase se puede observar todos los detalles de cada película, dependiendo de cual ah sido la seleccionado dentro del app.

Responsabilidad Unica: consiste en que cada una de las clases debe tener una sola parte de la funcionalidad dada por el software en este caso el app.
El principal propósito de esto es tratar de lograr el mayor rendimiento posible por cada una de las clases y en conjunto obtener el mayor rendimiento del software.

En mi opinion creo que me voy por el lado del código limpio, ya que para mi es dar un mayor enfoque al desarrollo, la legibilidad de la fuente y también dar la certeza del funcionamiento.
