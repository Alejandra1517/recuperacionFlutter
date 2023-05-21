import 'package:flutter/material.dart';
import 'package:flutter_application_2/product_model.dart';

class ListMateriales extends StatefulWidget {
  const ListMateriales({super.key});

  @override
  State<ListMateriales> createState() => _ListMaterialesState();
}

class _ListMaterialesState extends State<ListMateriales> {
  List<Producto> cart = [];

  void addCart(Producto product) {
    setState(() {
      cart.add(product);
    });
  }

  void aumentar(var i) {
    setState(() {
      i.quantity++;
    });
  }

  void disminuir(var i) {
    setState(() {
      if (i.quantity > 0) {
        i.quantity--;
      }
    });
  }

  List<Producto> productos = [];

  @override
  void initState() {
    loadProducto();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Productos List'),
        ),
        body: ListView.separated(
          itemCount: productos.length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(productos[index].id!.toString()),
              onDismissed: (direction) {
                setState(() {
                  productos.removeAt(index);
                });
                Producto.deleteMaterial(productos[index].id!);
              },
              background: Container(
                child: Text('Eliminar'),
                color: Colors.red,
              ),
              child: ListTile(
                title: Text(productos[index].nombre),
                subtitle: Text("${productos[index].cantidad}"),
              ),
            );
          },
        ));
  }

  void loadProducto() async {
    final productoList = await Producto.getMaterial();
    setState(() {
      productos = productoList;
    });
  }
}



  // child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: [
  //                       IconButton(
  //                           onPressed: () {
  //                             disminuir(products[index]);
  //                           },
  //                           icon: Icon(Icons.remove)),
  //                       Text('${products[index].quantity}'),
  //                       IconButton(
  //                           onPressed: () {
  //                             aumentar(products[index]);
  //                           },
  //                           icon: Icon(Icons.add))
  //                     ],
  //                   ),