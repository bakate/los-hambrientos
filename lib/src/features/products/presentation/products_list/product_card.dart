import 'package:flutter/material.dart';
import 'package:los_hambrientos/src/common_widgets/custom_image.dart';
import 'package:los_hambrientos/src/features/products/domain/product.dart';
import 'package:los_hambrientos/src/constants/app_sizes.dart';
import 'package:los_hambrientos/src/utils/currency_formatter.dart';

/// Used to show a single product inside a card.
class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, this.onPressed});
  final Product product;
  final VoidCallback? onPressed;

  // * Keys for testing using find.byKey()
  static const productCardKey = Key('product-card');

  @override
  Widget build(BuildContext context) {
    // TODO: Inject formatter
    //final priceFormatted = kCurrencyFormatter.format(product.price);
    final priceFormatted = kCurrencyFormatter.format(product.price);
    return Card(
      child: InkWell(
        key: productCardKey,
        onTap: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomImage(imageUrl: product.imageUrl),
            gapH8,
            const Divider(),
            gapH8,
            Padding(
                padding: const EdgeInsets.only(bottom: Sizes.p16),
                child: Column(
                  children: [
                    Text(product.title,
                        style: Theme.of(context).textTheme.headline6),
                    // if (product.numRatings >= 1) ...[
                    //   gapH8,
                    //   ProductAverageRating(product: product),
                    // ],
                    gapH24,
                    Text(priceFormatted,
                        style: Theme.of(context).textTheme.headline5),
                    gapH4,
                    Text(
                      product.availableQuantity <= 0
                          ? 'Out of Stock'
                          : 'Quantity: ${product.availableQuantity}',
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
