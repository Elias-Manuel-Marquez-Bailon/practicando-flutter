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
  final List<Ajustes> _listaSettings = [
    Ajustes(titulo: 'Recibir notificaciones resumen'),
    Ajustes(titulo: 'Sonido de alertas'),
    Ajustes(titulo: 'Modo vibracion'),
  ];
  int _contador = 0;
  bool estadoNotificacion = false;

  late int totalAjustes = _listaSettings.length;

  void _sumar () {
    setState(() {
      _contador++;
    });
  }

  void _restar () {
    setState(() {
      if(_contador > 0) {
        _contador--;
      }
    });
  }

  void _resetear () {
    setState(() {
      _contador = 0;
    });
  }

  void _alternarCompletada (Ajustes ajuste, bool value) {
    setState(() {
      int indiceOriginal = _listaSettings.indexOf(ajuste);
      _listaSettings[indiceOriginal] = Ajustes(titulo: ajuste.titulo, estado: value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView( // Permite scroll si la pantalla es muy pequeña
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. Notificaciones Generales
            const Text(
              'Notificaciones Generales',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text('Estado: ${estadoNotificacion ? "Activado" : "Desactivado"}'),

            const Divider(height: 32),

            // 2. Preferencias
            const Text(
              'Preferencias',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),

            // Mapeamos los ajustes sin necesidad de ListView ni Expanded
            ..._listaSettings.map((ajusteActual) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 4),
                child: ListTile(
                  title: Text(ajusteActual.titulo),
                  leading: Checkbox(
                    value: ajusteActual.estado,
                    onChanged: (bool? value) =>
                        _alternarCompletada(ajusteActual, value ?? false),
                  ),
                ),
              );
            }),

            const Divider(height: 32),

            // 3. Tamaño de Fuente
            const Text(
              'Tamaño de Fuente',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text('Nivel actual: $_contador'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _sumar,
                ),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: _restar,
                ),
              ],
            ),

            const Divider(height: 32),

            // 4. Botón Restablecer
            Center(
              child: IconButton(
                icon: const Icon(Icons.restart_alt),
                onPressed: _resetear,
                tooltip: 'Restablecer',
              ),
            ),
          ],
        ),
      ),
    );
  }

}


