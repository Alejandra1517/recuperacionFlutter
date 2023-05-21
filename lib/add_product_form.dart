import 'package:flutter/material.dart';

import 'package:flutter_application_2/list_materiales.dart';

import 'package:flutter_application_2/product_model.dart';

class AddProductForm extends StatefulWidget {
  const AddProductForm({super.key});

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final _formKey = GlobalKey<FormState>();
  final _ctrlNombreProducto = TextEditingController();
  final _ctrlCantidad = TextEditingController();
  final _ctrlPrecio = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario'),
      ),
      body: Column(
        children: [
          Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _ctrlNombreProducto,
                    decoration:
                        const InputDecoration(label: Text('Nombre Producto')),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingresa un nombre para el producto';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _ctrlCantidad,
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(label: Text('Cantidad Producto')),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingresa una cantidad';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _ctrlPrecio,
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(label: Text('Precio Producto')),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingresa un precio';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        submit();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Registro exitoso')),
                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ListMateriales()));
                      }
                    },
                    child: const Text('Enviar'),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  void submit() async {
    final nombre = _ctrlNombreProducto.text;
    final cantidad = _ctrlCantidad.text;
    final precio = _ctrlPrecio.text;
    Producto producto = Producto(
        nombre: nombre,
        cantidad: int.parse(cantidad),
        precio: double.parse(precio));

    await Producto.insertMaterial(producto);
  }
}
