# Aplicación Flutter Pokedex

Una aplicación Flutter simple que sirve como Pokedex, permitiendo a los usuarios ver una lista de Pokémon y explorar detalles sobre cada Pokémon individual.

## Características

- Obtiene datos de Pokémon desde una API RESTful.
- Muestra una lista de Pokémon con sus nombres e imágenes.
- Permite a los usuarios buscar Pokémon por nombre.
- Proporciona información detallada sobre cada Pokémon, incluyendo tipos y región.

## Capturas de Pantalla

![Pantalla de Inicio](screenshots/home_screen.png)
![Pantalla de Lista](screenshots/list_screen.png)
![Pantalla Individual de Pokémon](screenshots/individual_pokemon_screen.png)

## Inicio Rápido

Asegúrate de tener Flutter instalado en tu máquina. Para obtener instrucciones sobre cómo instalar Flutter, consulta la [documentación oficial de Flutter](https://flutter.dev/docs/get-started/install).

1. Clona el repositorio:

```bash
git clone https://github.com/tu-nombre-de-usuario/tu-app-flutter-pokemon.git
cd tu-app-flutter-pokemon
```

2. Instala las dependencias:

```bash
flutter pub get
```

3. Ejecuta la aplicación:

```bash
flutter run
```

## Dependencias

- [Flutter](https://flutter.dev/)
- [Provider](https://pub.dev/packages/provider)
- [http](https://pub.dev/packages/http)

## API Utilizada

La aplicación obtiene datos de Pokémon desde la siguiente API:

- URL Base de la API: `https://apirender-express-pokemon.onrender.com/api/v1/pokemons/`

Ten en cuenta que la API requiere una clave de API, y en el código proporcionado, se utiliza la clave `123` con fines de demostración. Reemplázala con una clave de API válida.

## Contribuciones

¡Las contribuciones son bienvenidas! Si encuentras algún problema o tienes mejoras para sugerir, siéntete libre de abrir un problema o crear una solicitud de extracción.

## Reconocimientos

- Gracias a las comunidades de Flutter y Dart.
- Datos de Pokémon proporcionados por la [API de Pokémon](https://apirender-express-pokemon.onrender.com/).

## Licencia

Este proyecto está bajo la Licencia MIT. Consulta el archivo [LICENSE](LICENSE) para obtener más detalles.

---

Siéntete libre de personalizar el README de acuerdo con los detalles y requisitos específicos de tu proyecto.
