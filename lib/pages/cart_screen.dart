import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/cart_widget.dart';
import '../cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: const Text('Cart',
          style: TextStyle(
              color: Colors.white
          ),),
      ),
      body: Column(
        children: [
          Expanded(
            child: CartWidget(),
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ))),
            onPressed: () {
              Provider.of<CartProvider>(context, listen: false).clearCart();
            },
            child: const Text('Clear Cart'),
          ),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}
