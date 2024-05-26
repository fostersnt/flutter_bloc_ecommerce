import 'dart:async';

import 'package:ecommerce/features/products/bloc/product_event.dart';
import 'package:ecommerce/features/products/bloc/product_state.dart';
import 'package:ecommerce/repositories/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitialState()) {
    on<ProductEvent>(productsFetching);
  }

  FutureOr<void> productsFetching(
      ProductEvent event, Emitter<ProductState> emit) async {
    try {
      emit(ProductLoadingState());
      var data = await ProductRepo.productsFetch();
      emit(ProductFetchedState(products: data));
    } catch (e) {
      emit(ProductErrorState());
    }
  }
}
