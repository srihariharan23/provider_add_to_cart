import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../cart_provider.dart';
import '../widgets/cart_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: const Text('Checkout',
          style: TextStyle(
              color: Colors.white
          ),),
      ),
      body: Column(
        children: [
          const Expanded(
            child: CartWidget(),
          ),
          _buildShippingForm(),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ))),
            onPressed: () {
              _placeOrder(context, cartProvider);
            },
            child: const Text('Place Order'),
          ),
          SizedBox(height: 20)
        ],
      ),
    );
  }

  Widget _buildShippingForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Shipping Information',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Address'),
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: const InputDecoration(labelText: 'City'),
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Zip Code'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  void _placeOrder(BuildContext context, CartProvider cartProvider) {
    // Simulate placing order
    // Here you can add the logic to send order details to your server/database
    cartProvider.clearCart();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Order Placed!'),
      duration: Duration(seconds: 2),
    ));
  }
}
