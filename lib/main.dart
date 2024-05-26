import 'package:ecommerce/ui/products/product_page.dart';
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
        // body: const Text("GHANA IS GHANA"),
        // body: const UserPage(),
        body: const ProductPage(),
        // body: const PostsPage(),
        // body: BlocProvider<ProductBloc>(
        //   create: (context) => ProductBloc(),
        //   child: const ProductPage(),
        // ),
      ),
    );
  }
}
