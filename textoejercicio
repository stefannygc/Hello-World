import 'package:flutter/material.dart';

import 'package:hello_world/main.dart';

class TextoEjercicio extends StatefulWidget {
  final titulo;
  TextoEjercicio(this.titulo);

  @override
  _TextoEjercicioState createState() => _TextoEjercicioState();
}

class _TextoEjercicioState extends State<TextoEjercicio> {
  //Paso #2
  //Definir un lista del tipo Cliente OJO Arriba import 'adicionar.dart'
  List<Cliente> _clientesadd = [];

  TextEditingController controladornombre;
  TextEditingController controladorapellido;
  TextEditingController controladortelefono;

  @override
  void initState() {
    controladornombre = TextEditingController();
    controladorapellido = TextEditingController();
    controladortelefono = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alert',
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.titulo),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                controller: controladornombre,
                decoration: InputDecoration(
                    filled: true,
                    labelText: 'Nombres',
                    // suffix: Icon(Icons.access_alarm),
                    suffix: GestureDetector(
                      child: Icon(Icons.close),
                      onTap: () {
                        controladornombre.clear();
                      },
                    )
                    //probar suffix
                    ),
              ),
            ),

            //Apellidos
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                controller: controladorapellido,
                decoration: InputDecoration(
                    filled: true,
                    labelText: 'Apellidos',
                    // suffix: Icon(Icons.access_alarm),
                    suffix: GestureDetector(
                      child: Icon(Icons.close),
                      onTap: () {
                        controladorapellido.clear();
                      },
                    )
                    //probar suffix
                    ),
              ),
            ),
            //Telefono
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                controller: controladortelefono,
                keyboardType: TextInputType.number, // Probar todos los teclados
                decoration: InputDecoration(
                    filled: true,
                    labelText: 'Telefono',
                    // suffix: Icon(Icons.access_alarm),
                    suffix: GestureDetector(
                      child: Icon(Icons.close),
                      onTap: () {
                        controladortelefono.clear();
                      },
                    )
                    //probar suffix
                    ),
              ),
            ),
            // Boton
            ElevatedButton(
              //Paso # 3
              //En el Boton Enviar Datos

              onPressed: () {
                if (controladornombre.text.isNotEmpty && controladorapellido.text.isNotEmpty) {
                  // Agregar a la lista los valores de cada texto

                  _clientesadd.add(Cliente(nombre: controladornombre.text, apellido: controladorapellido.text, telefono: controladortelefono.text));

                  // Devuelvo los datos de la lista _clientesadd
                  Navigator.pop(context, _clientesadd);
                }
              },
              child: Text('Guardar Datos'),
            ),

            //
          ],
        ),
      ),
    );
  }
}
