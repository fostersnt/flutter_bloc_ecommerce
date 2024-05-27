import 'package:ecommerce/screens/product/product_details.dart';
import 'package:ecommerce/screens/user/user_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  return {
    '/users': (context) => const UserPage(),
    '/product_details': (context) => ProductDetails(),
  };
}
