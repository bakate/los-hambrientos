import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:los_hambrientos/src/features/products/presentation/products_list/products_list_screen.dart';
import 'package:los_hambrientos/src/features/products/product_screen.dart';

enum AppRoute {
  home,
  product,
  leaveReview,
  cart,
  checkout,
  orders,
  account,
  signIn,
  favorites
}

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          name: AppRoute.home.name,
          path: '/',
          builder: (context, state) => const ProductsListScreen(),
          routes: [
            GoRoute(
              name: AppRoute.product.name,
              path: 'product/:id',
              builder: (context, state) {
                final productId = state.params['id']!;
                return ProductScreen(productId: productId);
              },
            )
          ],
        ),
      ],
    );
  },
);
