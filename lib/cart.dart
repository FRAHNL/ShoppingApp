import 'package:flutter/material.dart';
import 'product.dart';

class CartPage extends StatelessWidget {
  final List<Product> cart;
  const CartPage({super.key, required this.cart});
  double getTotalPrice(){
    return cart.fold(0, (total,item) => total + item.price);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: cart.isEmpty
        ? const Center(
            child: Text(
              'The cart is empty.',
              style: TextStyle(fontSize: 18),
            ),
          )
        : Column(
          children:[
            Expanded(
              child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index){
                  final item = cart[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove_circle),
                      onPressed:(){
                        cart.removeAt(index);
                        Navigator.pop(context);
                      },
                    ),
                  );
                },
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}