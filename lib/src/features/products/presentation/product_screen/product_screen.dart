import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:los_hambrientos/src/common_widgets/async_value_widget.dart';
import 'package:los_hambrientos/src/common_widgets/custom_image.dart';
import 'package:los_hambrientos/src/common_widgets/empty_placeholder_widget.dart';
import 'package:los_hambrientos/src/common_widgets/primary_button.dart';
import 'package:los_hambrientos/src/common_widgets/responsive_center.dart';
import 'package:los_hambrientos/src/common_widgets/responsive_two_column_layout.dart';
import 'package:los_hambrientos/src/constants/app_sizes.dart';
import 'package:los_hambrientos/src/features/products/data/fake_products_repository.dart';
import 'package:los_hambrientos/src/features/products/domain/product.dart';
import 'package:los_hambrientos/src/l10n/loc.dart';
import 'package:los_hambrientos/src/utils/currency_formatter.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.products_list),
      ),
      body: Consumer(builder: (context, ref, _) {
        final productValue = ref.watch(productProvider(productId));

        return AsyncValueWidget<Product?>(
            value: productValue,
            data: (product) => product == null
                ? const EmptyPlaceholderWidget(message: 'Product not found')
                : CustomScrollView(slivers: [
                    ResponsiveSliverCenter(
                      padding: const EdgeInsets.all(Sizes.p16),
                      child: ProductDetails(product: product),
                    )
                  ]));
      }),
    );
  }
}

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final priceFormatted = kCurrencyFormatter.format(product.price);

    return ResponsiveTwoColumnLayout(
      startContent: Card(
          child: Padding(
              padding: const EdgeInsets.all(Sizes.p16),
              child: CustomImage(
                imageUrl: product.imageUrl,
              ))),
      spacing: Sizes.p16,
      endContent: Card(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(product.title, style: Theme.of(context).textTheme.headline6),
              gapH8,
              Text(product.description,
                  style: Theme.of(context).textTheme.bodyText1),
              gapH16,
              Text(priceFormatted,
                  style: Theme.of(context).textTheme.headline4),
              gapH16,
              PrimaryButton(onPressed: () {}, text: context.loc.add_to_cart)
            ],
          ),
        ),
      ),
    );
  }
}
