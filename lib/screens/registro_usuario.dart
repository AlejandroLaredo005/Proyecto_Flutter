import 'package:flutter/material.dart';

class RegistroScreen extends StatelessWidget {
  const RegistroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'assets/images/logo.jpg',
                height: 100,
              ),
              const SizedBox(height: 20),
              // Título
              const Text(
                'Registrarse',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              // Campo Usuario
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue[700],
                  hintText: 'Usuario',
                  hintStyle: const TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              // Campo Contraseña
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue[700],
                  hintText: 'Contraseña',
                  hintStyle: const TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              // Campo Confirmar Contraseña
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue[700],
                  hintText: 'Confirmar',
                  hintStyle: const TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              // Botón de Registro
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Registro completado')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text('Registrarse'),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blue[900], // Fondo de la pantalla
    );
  }
}
