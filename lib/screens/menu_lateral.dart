import 'package:proyecto_flutter_alejandro/routes/imports.dart';

class MenuLateral extends StatelessWidget {
  final User user;

  const MenuLateral({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    // Obtiene la ruta actual
    String currentRoute = ModalRoute.of(context)?.settings.name ?? '';

    return Drawer(
      child: ListView(
        children: <Widget>[
           // Usamos un contenedor para tener un control más específico sobre la imagen
          Container(
            height: 300, 
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logo.jpg'), // Imagen de fondo
                fit: BoxFit.cover, // Asegura que la imagen cubra todo el espacio
              ),
            ),
          ),
          Ink(
            color: currentRoute == '/inicio' // Color cuando estamos en la ruta principal
                ? const Color.fromARGB(255, 0, 55, 255) // Color cuando es la ruta actual
                : const Color(0xFFE1F5FE), // Color por defecto
            child: ListTile(
              leading: const Icon(Icons.home, color: Colors.black), // Icono de casa
              title: Text(
                "Inicio",
                style: currentRoute == '/inicio'
                    ? const TextStyle(color: Colors.white) // Estilo para la ruta actual
                    : const TextStyle(color: Colors.black), // Estilo por defecto
              ),
              onTap: () {
                Navigator.pushNamed(
                    context,
                    '/inicio',
                    arguments: user, // Pasar el username a la pantalla del inicio
                  );
              },
            ),
          ),
          Ink(
            color: currentRoute == '/juego'
                ? const Color.fromARGB(255, 0, 55, 255) // Color cuando es la ruta actual
                : const Color(0xFFE1F5FE), // Color por defecto
            child: ListTile(
              leading: const Icon(Icons.games, color: Colors.black), // Icono de juego
              title: Text(
                "Juego",
                style: currentRoute == '/juego'
                ? const TextStyle(color: Colors.white) // Estilo para la ruta actual
                : const TextStyle(color: Colors.black), // Estilo por defecto
              ),
              onTap: () {
                Navigator.pushNamed(
                    context,
                    '/juego',
                    arguments: user, // Pasar el username a la pantalla del juego
                  );
              },
            ),
          ),
          Ink(
            color: currentRoute == '/estadisticas'
                ? const Color.fromARGB(255, 0, 55, 255) // Color cuando es la ruta actual
                : const Color(0xFFE1F5FE), // Color por defecto
            child: ListTile(
              leading: const Icon(Icons.bar_chart, color: Colors.black), // Icono de estadisticas
              title: Text(
                "Estadisticas",
                style: currentRoute == '/estadisticas'
                ? const TextStyle(color: Colors.white) // Estilo para la ruta actual
                : const TextStyle(color: Colors.black), // Estilo por defecto
              ),
              onTap: () {
                Navigator.pushNamed(
                    context,
                    '/estadisticas',
                    arguments: user, // Pasar el username a la pantalla de estadisticas
                  );
              },
            ),
          ),
          Ink(
            color: currentRoute == '/nosotros'
                ? const Color.fromARGB(255, 0, 55, 255) // Color cuando es la ruta actual
                : const Color(0xFFE1F5FE), // Color por defecto
            child: ListTile(
              leading: const Icon(Icons.info, color: Colors.black), // Icono de info
              title: Text(
                "Sobre Nosotros",
                style: currentRoute == '/nosotros'
                ? const TextStyle(color: Colors.white) // Estilo para la ruta actual
                : const TextStyle(color: Colors.black), // Estilo por defecto
              ),
              onTap: () {
                Navigator.pushNamed(
                    context,
                    '/nosotros',
                    arguments: user, // Pasar el username a la pantalla de nosotros
                  );
              },
            ),
          ),
        ],
      ),
    );
  }
}