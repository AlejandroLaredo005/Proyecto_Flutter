import 'imports.dart';

class AppRoutes {
  // Definir nombres para las rutas
  static const String inicioSesion = '/inicioSesion'; 
  static const String registro = '/registro';
  static const String inicio = '/inicio';
  static const String juego = '/juego';
  static const String estadisticas = '/estadisticas';
  static const String nosotros = '/nosotros';

  // Mapa de rutas
  static final Map<String, WidgetBuilder> routes = {
    inicioSesion: (context) => InicioSesionScreen(),
    registro: (context) => const RegistroScreen(),
    inicio: (context) => InicioScreen(user: ModalRoute.of(context)!.settings.arguments as User,),
    juego: (context) => GameScreen(user: ModalRoute.of(context)!.settings.arguments as User,),
    estadisticas: (context) => EstadisticasScreen(user: ModalRoute.of(context)!.settings.arguments as User,),
    nosotros: (context) => SobreNosotrosScreen(user: ModalRoute.of(context)!.settings.arguments as User,),
  };
}