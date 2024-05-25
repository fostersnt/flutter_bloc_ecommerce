// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce/models/product_model.dart';

sealed class ProductState {}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductErrorState extends ProductState {}

class ProductFetchedState extends ProductState {
  final List<ProductModel> products;
  ProductFetchedState({
    required this.products,
  });
}
