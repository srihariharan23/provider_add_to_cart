import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/product.dart';
import 'widgets/product_widget.dart';
import 'cart_provider.dart';
import 'pages/cart_screen.dart';
import 'pages/Checkout Screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Delivery App',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        initialRoute: '/', // Set initial route
        routes: {
          '/': (context) => const MyHomePage(), // Home page
          '/cart': (context) => const CartScreen(), // Cart screen
          '/checkout': (context) => const CheckoutScreen(), // Checkout screen
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: const Text('JurySoft Somato',
        style: TextStyle(
          color: Colors.white
        ),),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ProductWidget(
                  product: Product(
                    id: 1,
                    name: 'Orange',
                    price: 100.0,
                    imageUrl:
                        'https://images.unsplash.com/photo-1580052614034-c55d20bfee3b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8b3JhbmdlfGVufDB8fDB8fHww',
                  ),
                  addToCart: (product) =>
                      Provider.of<CartProvider>(context, listen: false)
                          .addToCart(product),
                ),
                ProductWidget(
                  product: Product(
                    id: 2,
                    name: 'Apple',
                    price: 200.0,
                    imageUrl:
                        'https://images.unsplash.com/photo-1589217157232-464b505b197f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8YXBwbGV8ZW58MHx8MHx8fDA%3D',
                  ),
                  addToCart: (product) =>
                      Provider.of<CartProvider>(context, listen: false)
                          .addToCart(product),
                ),
              ],
            ),
          ),
          Consumer<CartProvider>(
            builder: (context, cartProvider, child) => Text(
              'Total: \$${cartProvider.totalSum.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 24),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/cart'); // Navigate to cart screen
            },
            child: const Text('View Cart',
            style: TextStyle(
              color: Colors.white
            ),),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
            ),
            onPressed: () {
              Navigator.pushNamed(
                  context, '/checkout'); // Navigate to checkout screen
            },
            child: const Text('Proceed to Checkout',
              style: TextStyle(
                  color: Colors.white
              ),),
          ),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}
