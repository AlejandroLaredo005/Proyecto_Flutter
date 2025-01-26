import 'imports.dart';

class AppRoutes {
  // Definir nombres para las rutas
  static const String inicioSesion = '/inicioSesion'; 
  static const String registro = '/registro';

  // Mapa de rutas
  static final Map<String, WidgetBuilder> routes = {
    inicioSesion: (context) => const InicioSesionScreen(),
    registro: (context) => const RegistroScreen(),
  };
}