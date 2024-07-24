import 'package:ecommerce/data/cubit/product_cubit.dart';
import 'package:ecommerce/data/cubit/product_state.dart';
import 'package:ecommerce/screens/trial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  //Initializing widget binding
  WidgetsFlutterBinding.ensureInitialized();
  // Initializing hydrated local storage
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Commerce App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
        // home: const MyHomePage(title: "Foster's Store"),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const String fakePrompt = 'This product is fake';

    return Scaffold(
      appBar: AppBar(
        title: const Text("E-commerce"),
        // iconTheme: const IconThemeData(color: Colors.amber),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black87,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('BLOC PATTERN E-COMMERCE APP'),
          BlocConsumer<ProductCubit, ProductState>(
            listener: (context, state) {
              if (state is ProductLoadingState) {
                // ScaffoldMessenger.of(context).showSnackBar(
                //   const SnackBar(
                //     content: Text(fakePrompt),
                //     duration: Duration(seconds: 1),
                //   ),
                // );
                const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is ProductSuccessState && state.products.isNotEmpty) {
                return Text('PRODUCT NAME: ${state.products[0].title}');
              } else {
                return const Center(
                  child: Text('ERRORS SEEM TO EXIST'),
                );
              }
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<ProductCubit>(context).setFakeProductName();
                },
                child: const Text('Fake'),
              ),
              FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<ProductCubit>(context)
                      .setOriginalProductName();
                },
                child: const Text('Original'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
