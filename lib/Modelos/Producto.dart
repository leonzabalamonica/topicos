import 'package:firebase_database/firebase_database.dart';

class Producto {
  String id;
  String cantidad;
  String codigo;
  String nombre;
  String precio;

  Producto(this.id, this.cantidad, this.codigo, this.nombre, this.precio);

  Producto.fromSnapshot(DataSnapshot snapshot) {
    id = snapshot.key;
    cantidad = snapshot.value['cantidad'].toString();
    codigo = snapshot.value['codigo'].toString();
    nombre = snapshot.value['nombre'].toString();
    precio = snapshot.value['precio'].toString();
  }
  
}