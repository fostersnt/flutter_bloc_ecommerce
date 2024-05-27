import 'package:ecommerce/routes/app_routes.dart';
import 'package:ecommerce/screens/post/post_page.dart';
import 'package:ecommerce/screens/product/product_page.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: getAppRoutes(),
      title: 'E-Commerce App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("E-commerce"),
          foregroundColor: Colors.white,
          backgroundColor: Colors.black87,
        ),
        // body: const PostsPage(),
        body: const ProductPage(),
      ),
    );
  }
}
