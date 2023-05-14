import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order_list.dart';
import 'package:shop/pages/cart_page.dart';
import 'package:shop/pages/orders_page.dart';
import 'package:shop/pages/product_detail_page.dart';
import 'package:shop/pages/product_form_page.dart';
import 'package:shop/pages/product_page.dart';
import 'package:shop/utils/app_routes.dart';
import 'models/product_list.dart';
import 'pages/products_overview_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
          ),
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.home: (context) => ProductsOverviewPage(),
          AppRoutes.productDetail: (context) => const ProductDetailPage(),
          AppRoutes.cart: (context) => const CartPage(),
          AppRoutes.order: (context) => const OrdersPage(),
          AppRoutes.products: (context) => const ProductPage(),
          AppRoutes.productForm: (context) => const ProductFormPage(),
        },
      ),
    );
  }
}
