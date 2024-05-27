// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce/data/bloc/products/product_event.dart';
import 'package:ecommerce/data/bloc/products/product_state.dart';
import 'package:ecommerce/data/repository/product_repository.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  ProductBloc({required this.productRepository})
      : super(ProductInitialState()) {
    on<ProductEvent>((event, emit) async {
      emit(ProductLoadState());

      try {
        final products = await productRepository.getAllData();
        emit(ProductSuccessState(products: products));
      } catch (e) {
        emit(ProductErrorState(errorMessage: e.toString()));
      }
    });
  }
}
