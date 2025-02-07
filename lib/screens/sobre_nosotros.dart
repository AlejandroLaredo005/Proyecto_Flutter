import 'package:proyecto_flutter_alejandro/routes/imports.dart'; 

class SobreNosotrosScreen extends StatelessWidget {
  final User user;

  const SobreNosotrosScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      drawer: MenuLateral(user: user),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, 
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: [
            // Logo en la parte superior
            Image.asset(
              'assets/images/logo.jpg',
              height: 100,
            ),
            const SizedBox(height: 20),
            
            // Texto que describe la empresa
            const Text(
              'Sobre Nosotros',
              style: TextStyle(
                fontSize: 32, 
                fontWeight: FontWeight.bold, 
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            
            // Descripción de la empresa
            const Text(
              'Somos Hysinc, una empresa dedicada al desarrollo de juegos móviles innovadores y entretenidos. '
              'Nuestro objetivo es crear experiencias únicas para jugadores de todas las edades, siempre con la '
              'más alta calidad y creatividad. Nos apasiona el desarrollo de juegos que fomenten la diversión, la '
              'estrategia y el aprendizaje. ¡Nos encanta lo que hacemos y estamos comprometidos con brindar la '
              'mejor experiencia a nuestros usuarios!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18, 
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

