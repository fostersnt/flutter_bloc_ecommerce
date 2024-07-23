import 'package:flutter/material.dart';

void main() {
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
          // iconTheme: const IconThemeData(color: Colors.amber),
          foregroundColor: Colors.white,
          backgroundColor: Colors.black87,
        ),
        body: const Center(
          child: Text('BLOC PATTERN E-COMMERCE APP'),
        ),
      ),
      // home: const MyHomePage(title: "Foster's Store"),
    );
  }
}
