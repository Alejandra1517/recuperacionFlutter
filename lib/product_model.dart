import 'package:sqflite/sqflite.dart';

import 'db_helper.dart';

class Producto {
  final int? id;
  final String nombre;
  final int cantidad;
  final double precio;

  const Producto({
    this.id,
    required this.nombre,
    required this.cantidad,
    required this.precio,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'cantidad': cantidad,
      'precio': precio,
    };
  }

  @override
  String toString() {
    return 'Material{id: $id, nombre: $nombre, cantidad: $cantidad, precio: $precio}';
  }

  static Future<List<Producto>> getMaterial() async {
    final Database db = await DbHelper.initDb();
    final List<Map<String, dynamic>> maps = await db.query('materiales');
    return List.generate(maps.length, (i) {
      return Producto(
        id: maps[i]['id'],
        nombre: maps[i]['nombre'],
        cantidad: maps[i]['cantidad'],
        precio: maps[i]['precio'],
      );
    });
  }

  static Future<int> insertMaterial(Producto material) async {
    final Database db = await DbHelper.initDb();
    final int result = await db.insert('materiales', material.toMap());
    return result;
  }

  static Future<int> updateMaterial(Producto material) async {
    final Database db = await DbHelper.initDb();
    return await db.update(
      'materiales',
      material.toMap(),
      where: 'id = ?',
      whereArgs: [material.id],
    );
  }

  static Future<int> deleteMaterial(int id) async {
    final Database db = await DbHelper.initDb();
    return await db.delete(
      'materiales',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
