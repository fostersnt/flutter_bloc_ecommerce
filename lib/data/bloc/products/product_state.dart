// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce/data/model/product_model.dart';

sealed class ProductState {}

class ProductInitialState extends ProductState {}

class ProductLoadState extends ProductState {}

class ProductErrorState extends ProductState {
  final String errorMessage;

  ProductErrorState({required this.errorMessage});
}

class ProductSuccessState extends ProductState {
  final List<ProductModel> products;
  ProductSuccessState({
    required this.products,
  });
}
