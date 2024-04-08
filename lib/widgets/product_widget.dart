import 'package:flutter/material.dart';
import '../model/product.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  final Function(Product) addToCart;

  const ProductWidget({super.key, required this.product, required this.addToCart});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(product.imageUrl),
      title: Text(product.name),
      subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
      trailing: IconButton(
        icon: const Icon(Icons.add_shopping_cart),
        onPressed: () => addToCart(product),
      ),
    );
  }
}
