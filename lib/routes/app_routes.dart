import 'package:ecommerce/screens/product/product_details.dart';
import 'package:ecommerce/screens/user/user_page.dart';
import 'package:flutter/material.dart';

/*
NOTE

Make sure you have through the entire application before removing something from this file. 
Any changes made to any of these existing routes will affect a section of the application

*/

Map<String, WidgetBuilder> getAppRoutes() {
  return {
    '/users': (context) => const UserPage(),
    '/product_details': (context) => const ProductDetails(),
  };
}
