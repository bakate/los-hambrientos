import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:los_hambrientos/src/l10n/loc.dart';
import 'package:los_hambrientos/src/routing/app_router.dart';

class ProductsListScreen extends StatelessWidget {
  const ProductsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(context.loc.products_list),
        ),
        body: Column(children: [
          Text(context.loc.products_list,
              style: const TextStyle(fontSize: 32.0)),
          const SizedBox(height: 32.0),
          ElevatedButton(
              onPressed: () => context
                  .goNamed(AppRoute.product.name, params: {'id': "Bakate"}),
              child: Text(context.loc.products_list)),
        ]));
  }
}
