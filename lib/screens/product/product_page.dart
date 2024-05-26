import 'package:ecommerce/data/bloc/products/product_bloc.dart';
import 'package:ecommerce/data/bloc/products/product_event.dart';
import 'package:ecommerce/data/bloc/products/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // create: (context) => ProductBloc()..add(AllProductsFetchEvent()),
      create: (context) => ProductBloc(),
      // context.read<ProductBloc>().add(AllProductsFetchEvent()),
      child: const ProductView(),
    );
  }
}

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>().add(AllProductsFetchEvent());
    return Center(
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoadingState) {
            print("DATA NOT PRESENT");
            return const CircularProgressIndicator();
          } else if (state is ProductFetchedState) {
            print("DATA PRESENT");
            var productsData = state;
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: ListView.builder(
                  itemCount: productsData.products.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          color: Colors.grey.shade200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                productsData.products[index].title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                productsData.products[index].description,
                                maxLines: 3,
                                overflow: TextOverflow.fade,
                                style: const TextStyle(),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "GHs ${productsData.products[index].price.toString()}",
                                maxLines: 3,
                                overflow: TextOverflow.fade,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.red,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Image.network(
                                productsData.products[index].image,
                                height: 350,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.fill,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                            : null,
                                      ),
                                    );
                                  }
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return Text(error.toString());
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          } else {
            print("EMPTY DATA");
            return const SizedBox();
          }
        },
      ),
    );
  }
}
