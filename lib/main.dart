import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order_list.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/pages/cart_page.dart';
import 'package:shop/pages/orders_page.dart';
import 'package:shop/pages/product_detail.dart';
import 'package:shop/pages/product_form_page.dart';
import 'package:shop/pages/product_overview_page.dart';
import 'package:shop/pages/products_page.dart';
import 'package:shop/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = ThemeData();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderList(),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: 'Lato',
            colorScheme: theme.colorScheme.copyWith(
              primary: Colors.purple,
              secondary: Colors.deepOrange,
            ),
          ),
          debugShowCheckedModeBanner: false,
          routes: {
            AppRoutes.HOME: (ctx) => ProductOverview(),
            AppRoutes.PRODUCT_DETAIL: (ctx) => const ProductDetail(),
            AppRoutes.CART: (ctx) => const CartPage(),
            AppRoutes.ORDERS: (ctx) => OrdersPage(),
            AppRoutes.PRODUCTS: (ctx) => const ProductsPage(),
            AppRoutes.PRODUCT_FORM: (ctx) => const ProductFormPage(),
          }),
    );
  }
}
