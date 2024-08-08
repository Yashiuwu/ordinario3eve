import 'package:flutter/material.dart';
import 'package:tienda_de_ropa/item.dart';

class OrderSummaryScreen extends StatelessWidget {
  final Item item;
  final String size;
  final int quantity;

  OrderSummaryScreen({required this.item, required this.size, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resumen del Pedido'),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 250.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: DecorationImage(
                      image: AssetImage('assets/images/${item.image}'),
                      fit: BoxFit.contain, // Ajusta la imagen para que se vea completa sin recortarse
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text('Prenda: ${item.name}', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
              Text('Talla: $size', style: TextStyle(fontSize: 24.0)),
              Text('Cantidad: $quantity', style: TextStyle(fontSize: 24.0)),
              Text('Precio Total: \$${item.price * quantity}', style: TextStyle(fontSize: 24.0, color: Colors.blueGrey[700])),
              Spacer(),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Lógica para confirmar el pedido
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: Text('Confirmar Pedido'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
