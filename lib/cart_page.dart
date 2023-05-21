import 'package:flutter/material.dart';
import 'package:flutter_application_2/product_model.dart';

class CartPage extends StatefulWidget {
  final List<Producto> cart;
  const CartPage({super.key, required this.cart});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    double total =
        widget.cart.fold(0, (sum, item) => sum + (item.precio * item.cantidad));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito'),
      ),
      body: ListView.separated(
        itemCount: widget.cart.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.cart[index].nombre,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text('\$ ${widget.cart[index].cantidad}'),
                ],
              ),
              Text('${widget.cart[index].precio}'),
              IconButton(
                  onPressed: () {
                    setState(() {
                      widget.cart.removeAt(index);
                    });
                  },
                  icon: const Icon(Icons.remove_shopping_cart))
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            setState(() {
              if (widget.cart.isNotEmpty) {
                widget.cart.clear();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Compra exitosa'),
                    backgroundColor: Color.fromARGB(255, 85, 143, 86),
                  ),
                );
              }
            });
          },
          label: Text('Total \$$total')),
    );
  }
}
