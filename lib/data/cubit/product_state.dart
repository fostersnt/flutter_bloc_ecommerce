// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ecommerce/data/models/product_model.dart';

// part of 'product_cubit.dart';

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'products': products.map((x) => x.toMap()).toList(),
      'isFake': isFake,
    };
  }

  factory ProductSuccessState.fromMap(Map<String, dynamic> map) {
    return ProductSuccessState(
      products: List<ProductModel>.from(
        (map['products'] as List<int>).map<ProductModel>(
          (x) => ProductModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      isFake: map['isFake'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductSuccessState.fromJson(String source) =>
      ProductSuccessState.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ProductErrorState extends ProductState {
  final String errorMessage;

  ProductErrorState({required this.errorMessage});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'errorMessage': errorMessage,
    };
  }

  factory ProductErrorState.fromMap(Map<String, dynamic> map) {
    return ProductErrorState(
      errorMessage: map['errorMessage'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductErrorState.fromJson(String source) =>
      ProductErrorState.fromMap(json.decode(source) as Map<String, dynamic>);
}
