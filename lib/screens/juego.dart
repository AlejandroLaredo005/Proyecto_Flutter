import 'package:proyecto_flutter_alejandro/routes/imports.dart';
import 'package:http/http.dart' as http;

class GameScreen extends StatefulWidget {
  final User user;
  const GameScreen({super.key, required this.user});

  @override
  // ignore: library_private_types_in_public_api
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String flagUrl = '';
  String correctCountry = '';
  List<String> options = [];
  int streak = 0;
  final DatabaseHelper dbHelper = DatabaseHelper.instance;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchNewFlag(); // Llama a la función para obtener una nueva bandera al inicio
  }

  // Función para obtener una nueva bandera y opciones de respuesta
  Future<void> fetchNewFlag() async {
    setState(() {
      isLoading = true; // Activa el indicador de carga
    });

    try {
      final response = await http.get(Uri.parse('https://restcountries.com/v3.1/all?fields=name,flags'));

      if (response.statusCode == 200) {
        List<dynamic> countries = jsonDecode(response.body);
        var randomCountry = countries[Random().nextInt(countries.length)];
        setState(() {
          flagUrl = randomCountry['flags']['png'];
          correctCountry = randomCountry['name']['common'];

          // Generar opciones de respuesta
          options = [correctCountry];
          while (options.length < 3) {
            var randomOption = countries[Random().nextInt(countries.length)]['name']['common'];
            if (!options.contains(randomOption)) {
              options.add(randomOption);
            }
          }
          options.shuffle(); // Mezcla las opciones para que no estén ordenadas
        });
      } else {
        throw Exception('Error al cargar los datos del servidor');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error al obtener datos: $e');
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al obtener la bandera, intenta de nuevo.')),
      );
    } finally {
      setState(() {
        isLoading = false; // Desactiva el indicador de carga al finalizar
      });
    }
  }

  // Función que verifica si la respuesta seleccionada es correcta
  void checkAnswer(String selected) {
    setState(() {
      if (selected == correctCountry) {
        streak++; // Incrementa la racha si la respuesta es correcta
        widget.user.totalCorrect++;
        if (streak > widget.user.bestStreak) {
          widget.user.bestStreak = streak; // Actualiza la mejor racha
        }
      } else {
        streak = 0; // Resetea la racha si la respuesta es incorrecta
        widget.user.totalIncorrect++;
      }
      updateUserStats(); // Actualiza las estadísticas del usuario en la base de datos
      fetchNewFlag(); // Obtiene una nueva bandera
    });
  }

  // Actualiza las estadísticas del usuario en la base de datos
  Future<void> updateUserStats() async {
    try {
      await dbHelper.updateStatistics(widget.user);
    } catch (e) {
      // ignore: avoid_print
      print('Error al actualizar estadísticas: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
      ),
      drawer: MenuLateral(user: widget.user),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                'assets/images/logo.jpg',
                height: 100,
              ),
              const SizedBox(height: 20),
            // Texto grande encima de la bandera
            const Text(
             '¡Adivina la bandera!',
              style: TextStyle(
               color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          const SizedBox(height: 20),
            isLoading  // Muestra un indicador de carga mientras se obtiene la bandera
                ? const CircularProgressIndicator()
                : flagUrl.isNotEmpty
                    ? Image.network(flagUrl, width: 200, height: 150) // Muestra la bandera si está disponible
                    : const Icon(Icons.image_not_supported, size: 100, color: Colors.white),
            const SizedBox(height: 20),
            // Muestra los botones con las opciones de países
            ...options.map((country) => SizedBox(
              width: 350, // Ancho fijo para todos los botones
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0), // Espaciado entre los botones
                child: ElevatedButton(
                  onPressed: () => checkAnswer(country),
                  child: Text(country),
                ),
              ),
            )),
            const SizedBox(height: 20),
            // Muestra las estadísticas de la racha actual y la mejor racha
            Text('Racha actual: $streak', style: const TextStyle(color: Colors.white, fontSize: 20)),
            Text('Mejor racha: ${widget.user.bestStreak}', style: const TextStyle(color: Colors.white, fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

