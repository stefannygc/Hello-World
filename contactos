import 'package:flutter/material.dart';

void main() => runApp(MisContactos());

class MisContactos extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MisContactos> {
  List<Cliente> _clientes = [
    Cliente(nombre: 'Stefanny', apellido: 'Gutierrez Camarillo ', telefono: '3212444272'),
    Cliente(nombre: 'Matias', apellido: 'Montes Sanchez', telefono: '3041558909'),
    Cliente(nombre: 'Camila', apellido: 'Cortez Mendez', telefono: '3112630088'),
    Cliente(nombre: 'Tobias', apellido: 'Gomez Torres', telefono: '3231120864'),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.pink),
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Stefanny Gutierrez Camarillo -Contactos'),
          ),
          body: ListView.builder(
              itemCount: _clientes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onLongPress: () {
                    _eliminarCliente(context, _clientes[index]);
                  },
                  title: Text(_clientes[index].nombre + ' ' + _clientes[index].apellido),
                  subtitle: Text(_clientes[index].telefono),
                  leading: CircleAvatar(
                    child: Text(_clientes[index].apellido.substring(0, 1)),
                  ),
                  trailing: Icon(Icons.call),
                );
              }),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Eliminar Cliente',
            child: Icon(Icons.add),
          )),
    );
  }

  _eliminarCliente(context, Cliente clienteid) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text('Eliminar Cliente'),
              content: Text('Esta seguro de eliminar a: ' + clienteid.nombre),
              actions: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        this._clientes.remove(clienteid);
                        Navigator.pop(context);
                      });
                    },
                    child: Text(
                      'Eliminar',
                      style: TextStyle(color: Colors.deepPurple),
                    )),
                TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ));
  }
}

class Cliente {
  var nombre;
  var apellido;
  var telefono;

  Cliente({this.nombre, this.apellido, this.telefono});
}
