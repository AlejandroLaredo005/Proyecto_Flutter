import 'package:proyecto_flutter_alejandro/routes/imports.dart';

class InicioScreen extends StatelessWidget {
  final User user;

  const InicioScreen({super.key, required this.user});

  void mostrarMensaje(BuildContext context, String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensaje)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
      ),
      drawer: MenuLateral(user: user),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.jpg',
              height: 100,
            ),
            const SizedBox(height: 20),
            Text(
              'Bienvenido, ${user.username}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            // Botón Jugar
            SizedBox(
              width: 220, // Establece un ancho fijo para los botones
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/juego',
                    arguments: user, // Pasar el username a la pantalla del juego
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text('Jugar'),
              ),
            ),
            const SizedBox(height: 20),
            // Botón Estadísticas
            SizedBox(
              width: 220, // Ancho igual para todos los botones
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/estadisticas',
                    arguments: user, // Pasar el username a la pantalla de estadísticas
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text('Estadísticas'),
              ),
            ),
            const SizedBox(height: 20),
            // Botón Sobre nosotros
            SizedBox(
              width: 220, // Ancho igual para todos los botones
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/nosotros',
                    arguments: user, // Pasar el username a la pantalla de nosotros
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text('Sobre nosotros'),
              ),
            ),
            const SizedBox(height: 20),
            // Botón Cerrar Sesión
            SizedBox(
              width: 220, // Ancho igual para todos los botones
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/inicioSesion');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text('Cerrar Sesión'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}