import 'package:flutter/material.dart';
import 'package:los_hambrientos/src/l10n/loc.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key, required this.productId}) : super(key: key);

  final String productId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(context.loc.products_list),
        ),
        body: Column(children: [
          Text(productId, style: const TextStyle(fontSize: 32.0)),
          const SizedBox(height: 32.0),
        ]));
  }
}
