import 'package:flutter/material.dart';
import 'package:flutter_application_2/add_product_form.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina principal'),
      ),
      body: Column(
        children: [
          const Text('Materiales'),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddProductForm()));
            },
            child: const Text('añadir materiales'),
          ),
        ],
      ),
    );
  }
}
