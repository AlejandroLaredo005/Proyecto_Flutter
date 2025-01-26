import 'package:flutter/material.dart';

class InicioSesionScreen extends StatelessWidget {
  const InicioSesionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.jpg',
                height: 100,
              ),
              const SizedBox(height: 20),
              const Text(
                'Iniciar Sesión',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
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
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Inicio de sesión presionado')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text('Iniciar Sesión'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/registro');
                },
                child: const Text(
                  '¿No tienes cuenta? Regístrate',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
