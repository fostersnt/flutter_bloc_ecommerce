import 'package:ecommerce/data/bloc/products/product_bloc.dart';
import 'package:ecommerce/data/bloc/products/product_event.dart';
import 'package:ecommerce/data/bloc/products/product_state.dart';
import 'package:ecommerce/data/provider/product_provider.dart';
import 'package:ecommerce/data/repository/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) =>
          ProductRepository(productProvider: ProductProvider()),
      child: BlocProvider(
        create: (context) => ProductBloc(
          productRepository: ProductRepository(
            productProvider: ProductProvider(),
          ),
        ),
        child: const ProductView(),
      ),
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
          if (state is ProductLoadState) {
            print("DATA NOT PRESENT");
            return const CircularProgressIndicator();
          } else if (state is ProductSuccessState) {
            print("DATA PRESENT");
            final productsData = state.products;
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: ListView.builder(
                  itemCount: productsData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      // String url = productsData[index].image.toString();
                      padding: const EdgeInsets.all(5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () => Navigator.pushNamed(
                              context, '/product_details',
                              arguments: productsData[index]),
                          child: Card(
                            color: Colors.white,
                            child: ListTile(
                              leading: Container(
                                width: 100,
                                height: 150.0,
                                child: Image.network(
                                  productsData[index].image.toString(),
                                  fit: BoxFit
                                      .fill, // Adjust the fit to your needs
                                ),
                              ),
                              // CircleAvatar(
                              //   backgroundImage: NetworkImage(
                              //       productsData[index].image.toString(),
                              //       scale: 200),
                              // ),
                              title: Text(
                                productsData[index].title.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: Text(
                                productsData[index].description.toString(),
                                maxLines: 5,
                                overflow: TextOverflow.fade,
                              ),
                            ),
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
