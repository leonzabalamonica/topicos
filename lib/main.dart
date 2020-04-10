

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_flutter/Modelos/Producto.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
 
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 //creanto un tamano estandar para mis textos
  final estiloTexto= new TextStyle(fontSize: 15);

  DatabaseReference databaseReference = FirebaseDatabase.instance.reference();   
  List<Producto> listaProductos = new List();


  @override
  void initState() { 
    super.initState();  
    /*
    databaseReference.child("producto").once().then((DataSnapshot snapshot) {      
      Map<dynamic, dynamic> data = snapshot.value;
      data.forEach((k, v) {
        //listaProductos.add(Producto.fromSnapshot(k, v));
        listaProductos.add(Producto(k, v["cantidad"].toString(), v["nombre"].toString(), v["precio"].toString()));        
      });
    });
    */

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Flutter Topicos"),
      ),
      body: FirebaseAnimatedList(
        query: databaseReference.child("producto"),
        itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
          return SizeTransition(
            sizeFactor: animation,          
            child: showProducto(snapshot),            
          );
        },
      ),
    );

  }
 
  Widget showProducto(DataSnapshot snapshot){
    Producto producto = Producto.fromSnapshot(snapshot);
    Card card = Card(
      elevation: 30.0,
      child: Column(
        children: <Widget>[         
          ListTile(
            leading: Icon(Icons.ac_unit, color: Colors.blue),
            title: Text("NOMBRE: " + producto.nombre + "\n" + "CODIGO: " + producto.codigo) ,
            subtitle: Text("PRECIO: " + producto.precio +" Bs."+"\n" + "CANTIDAD: " + producto.cantidad+" u."),
            onTap: () {

            },
          ),
        ],
      )
    );
    return card;
  }

}
