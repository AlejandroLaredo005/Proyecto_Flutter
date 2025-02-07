import 'package:proyecto_flutter_alejandro/routes/imports.dart'; 

class EstadisticasScreen extends StatelessWidget {
  final User user;

  const EstadisticasScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center( 
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
              
              // Texto grande con el nombre del usuario
              Text(
                "Hola, ${user.username}!",
                style: const TextStyle(
                  fontSize: 32, 
                  fontWeight: FontWeight.bold, 
                  color: Colors.white
                ),
              ),
              const SizedBox(height: 20),
              
              // Texto que indica las estadísticas
              const Text(
                'Estas son tus estadísticas:',
                style: TextStyle(
                  fontSize: 24, 
                  color: Colors.white
                ),
              ),
              const SizedBox(height: 40),
              
              // Estadísticas del usuario
              Text(
                'Correctas: ${user.totalCorrect}',
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              Text(
                'Incorrectas: ${user.totalIncorrect}',
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              Text(
                'Mejor racha: ${user.bestStreak}',
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
