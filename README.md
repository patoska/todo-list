# To-Do List

## Ejecución
  Para correr este progamas necesitas docker compose, para la primera vez que lo corres necesitas:
```bash
docker compose up --build
```
Luego que las imagenes estén listas y la app esté corriendo, en una terminal distinta debes ejecutar:
```bash
docker compose exec -it ollama ollama run llama3
```
Esto permitirá hacer las estimaciones de las distintas tareas.

Luego, puedes acceder a la app desde tu navegador en `http://localhost:5173`

## IA
* El apartado de `ollama` en `docker-compose.yml` fue generado con IA junto con el servicio `LlmService`
* El computado `formattedDate` para que quedara bien con el datepicker
* Dudas generales como "mysql larger text type for image base64", "vuejs pinia store remove one element", etc

Para el tema de ollama, corrí el codigo e iteré un poco respecto a su uso.  
Para el resto, simplemente tomaba la parte que me servía y lo adaptaba al uso que quería darle  
Respecto a la generacion "incorrecta", no fue tal. en algunos casos me ejemplificaba en un framework distinto, por ejemplo como interactuar con el contenedor de ollama usando express.

## Decisiones
* El uso de VueJS se debe a que ya tenía un esqueleto funcional que me permitió adaptarlo rápidamente.
* El uso de Rails se debe a que parte del stack de Saludtech es en rails y consideré oportuno que pudieran revisar el uso que le doy.
* Decidí usar las imagenes del avatar de los usuarios como un string base 64, esto se debe a la rápidez de esta implementación sabiendo que esto solo se trata de un ejercicio. En cualquier otro escenario lo mejor sería usar un bucket encargado de almacenar cualquier tipo de archivo, Active Storage en el caso de Rails o cualquier otro dependiendo de la herramienta que se esté utilizando.
* Si bien, en las imagenes del enunciado se pueden desprender varias funcionalidades no escritas como los usuarios, comentarios, notificaciones. decidí solo implementar la creacion de usuarios previa consulta junto a los requerimientos escritos.
* Siempre se debe testear el código, pero al tratarse de un ejercicio no lo hice.

## Tiempo estimado

* ~1 hr y 30 min para iniciar toda la logica de la app, modelos ToDo y User junto al front para creación y eliminacion de ToDos y Users
* ~2 hr implementación de la consulta llm junto a las funcionalidades que quedaban pendientes
* Luego invertí un poco más arreglando algunas cosas estéticas y funcionales no tan relevantes pero necesarias como el datepicker
