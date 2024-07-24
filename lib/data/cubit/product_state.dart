// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_cubit.dart';

class ProductState {
  // final String productName;
  // final bool isFake;
  // ProductState({required this.productName, required this.isFake});
}

class ProductLoadingState extends ProductState {}

class ProductSuccessState extends ProductState {
  final List<ProductModel> products;
  final bool isFake;
  ProductSuccessState({required this.products, required this.isFake});
}

class ProductErrorState extends ProductState {
  final String errorMessage;

  ProductErrorState({required this.errorMessage});
}
