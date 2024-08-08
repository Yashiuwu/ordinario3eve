import 'package:flutter/material.dart';
import 'package:tienda_de_ropa/item.dart';
import 'order_summary_screen.dart';

class SelectSizeScreen extends StatefulWidget {
  final Item item;

  SelectSizeScreen({required this.item});

  @override
  _SelectSizeScreenState createState() => _SelectSizeScreenState();
}

class _SelectSizeScreenState extends State<SelectSizeScreen> {
  String? selectedSize;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleccionar Talla y Cantidad'),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                        image: AssetImage('assets/images/${widget.item.image}'),
                        fit: BoxFit.contain, // Ajusta la imagen para que se vea completa sin recortarse
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(widget.item.name, style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
                Text('\$${widget.item.price}', style: TextStyle(fontSize: 24.0, color: Colors.blueGrey[700])),
                SizedBox(height: 20.0),
                Text('Seleccionar Talla:', style: TextStyle(fontSize: 18.0)),
                DropdownButton<String>(
                  value: selectedSize,
                  items: ['S', 'M', 'L', 'XL'].map((String size) {
                    return DropdownMenuItem<String>(
                      value: size,
                      child: Text(size, style: TextStyle(fontSize: 18.0)),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedSize = newValue;
                    });
                  },
                  hint: Text('Elige una talla'),
                ),
                SizedBox(height: 20.0),
                Text('Seleccionar Cantidad:', style: TextStyle(fontSize: 18.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove_circle_outline, color: Colors.blueGrey[700]),
                      onPressed: () {
                        setState(() {
                          if (quantity > 1) quantity--;
                        });
                      },
                    ),
                    Text(quantity.toString(), style: TextStyle(fontSize: 24.0)),
                    IconButton(
                      icon: Icon(Icons.add_circle_outline, color: Colors.blueGrey[700]),
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Center(
                  child: ElevatedButton(
                    onPressed: selectedSize != null
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrderSummaryScreen(
                                  item: widget.item,
                                  size: selectedSize!,
                                  quantity: quantity,
                                ),
                              ),
                            );
                          }
                        : null,
                    child: Text('Agregar al Carrito'),
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
      ),
    );
  }
}
