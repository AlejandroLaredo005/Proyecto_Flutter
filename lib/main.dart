import 'routes/imports.dart';

void main() {
  runApp(const HysincApp());
}

class HysincApp extends StatelessWidget {
  const HysincApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hysinc Games',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Ruta inicial
      initialRoute: AppRoutes.inicioSesion, 
      // Definición de rutas
      routes: AppRoutes.routes, 
    );
  }
}
