import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ConfiguracionPage(title: 'Ajuste de usuario'),
    );
  }
}

class ConfiguracionPage extends StatefulWidget {
  const ConfiguracionPage ({super.key, required this.title});

  final String title;

  @override
  State<ConfiguracionPage> createState ()=> _ConfiguracionPageState();
}

class Ajustes {
  final String titulo;
  final bool estado;
  Ajustes({
    required this.titulo,
    this.estado = false,
  });
}

class _ConfiguracionPageState extends State<ConfiguracionPage> {
  List<Ajustes> listaSettings = [
    Ajustes(titulo: 'Recibir notificaciones resumen'),
    Ajustes(titulo: 'Sonido de alertas'),
    Ajustes(titulo: 'Modo vibracion'),
  ];
  int _contador = 0;
  bool estadoNotificacion = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }

}


