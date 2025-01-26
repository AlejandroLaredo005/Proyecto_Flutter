import 'package:flutter/material.dart';

class AppThemes {
  // Tema personalizado para la aplicación
  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: Colors.blue[900], // Fondo del Scaffold
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white, fontSize: 16), // Texto normal
      bodyMedium: TextStyle(color: Colors.white70, fontSize: 14), // Texto secundario
      displayLarge: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold), // Título
      displayMedium: TextStyle(color: Colors.white70, fontSize: 28), // Subtítulos
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.blue[700],  // Color del texto del botón
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Bordes redondeados
        ),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15), // Espaciado dentro del botón
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.blue[700], // Fondo de los campos de texto
      hintStyle: const TextStyle(color: Colors.white70), // Estilo del texto de los hints
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none, // Sin borde
      ),
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
        .copyWith(surface: Colors.blue[900]),
  );
}
