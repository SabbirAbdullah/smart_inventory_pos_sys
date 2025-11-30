import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../views/home_view.dart';
import '../views/scanned_products_view.dart';

class AppRoutes {
  static const String home = '/';
  static const String scannedProducts = '/scanned-products';
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: AppRoutes.scannedProducts,
      builder: (context, state) => const ScannedProductsView(),
    ),
  ],
);
