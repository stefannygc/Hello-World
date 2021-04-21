import 'package:hello_world/componentes/textoejercicio.dart 'package:hello_world/componentes/textoejercicio.dart't 'package:hello_world/componentes/textoejercicio.dart 'package:hello_world/componentes/textoejercicio.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/componentes/api.dart';

void main() {
  runApp(PeticionHttp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(title: 'Listas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Cliente> _clientes = [
    Cliente(nombre: 'Alexander', apellido: 'Vacca', telefono: '3017143496'),
    Cliente(nombre: 'Maria', apellido: 'Perez', telefono: '3017143496'),
    Cliente(nombre: 'Pedro', apellido: 'Rojas', telefono: '3017143496'),
    Cliente(nombre: 'Alejandra', apellido: 'de la hoz', telefono: '3017143496'),
    Cliente(nombre: 'Juana', apellido: 'Quintero', telefono: '3017143496'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: _clientes.length,
          itemBuilder: (context, index) {
            return ListTile(
              onLongPress: () {
                setState(() {
                  _eliminarcliente(context, _clientes[index]);
                });
              },
              title: Text(_clientes[index].nombre + ' ' + _clientes[index].apellido),
              subtitle: Text(_clientes[index].telefono),
              leading: CircleAvatar(
                child: Text(_clientes[index].nombre.substring(0, 1) + _clientes[index].apellido.substring(0, 1)),
              ),
              trailing: Icon(Icons.arrow_circle_up),
            );
          }),

      //Paso # 1
      //Este es el Boton Adicionar
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => TextoEjercicio(widget.title), //Llamar la Vista TextoEjercicio
            ),
          ).then((resultado) //Espera por un Resultado
              {
            _clientes.addAll(resultado); //Adiciona a la lista lo que recupera de la vista TextoEjercicio
            setState(() {});
          });
        },
        tooltip: 'Adicionar Cliente',
        child: Icon(Icons.add),
      ),

      //
    );
  }

  _eliminarcliente(context, Cliente climsg) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Elimnar Cliente'),
        content: Text('Esta Seguro de Eliminar' + climsg.nombre + '?'),
        actions: [
          TextButton(
            onPressed: () {
              this._clientes.remove(climsg);
              Navigator.pop(context);
            },
            child: Text(
              'Eliminar',
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Cancelar',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}

class Cliente {
  var nombre;
  var apellido;
  var telefono;

  Cliente({this.nombre, this.apellido, this.telefono});
}
