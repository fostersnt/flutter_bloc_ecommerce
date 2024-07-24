import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/cubit/product_state.dart';
import 'package:ecommerce/data/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:hydrated_bloc/hydrated_bloc.dart';

// part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> with HydratedMixin {
  ProductCubit() : super(ProductSuccessState(products: [], isFake: false));

  void setOriginalProductName() =>
      emit(ProductSuccessState(products: [], isFake: false));
  void setFakeProductName() async {
    try {
      emit(ProductLoadingState());
      String url = 'https://fakestoreapi.com/products';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        print('PRODUCT DATA === $jsonData');
        List<ProductModel> data = [];
        for (var i = 0; i < jsonData.length; i++) {
          data.add(ProductModel.fromMap(jsonData[i]));
        }
        print('DDDDD === ${data[0].title}');
        emit(ProductSuccessState(products: data, isFake: true));
      } else {
        print('PRODUCT RESPONSE === $response');
      }
    } catch (e) {
      print('PRODUCT FETCH ERROR === ${e.toString()}');
    }
  }

  @override
  ProductSuccessState? fromJson(Map<String, dynamic> json) {
    return ProductSuccessState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ProductState state) {
    if (state is ProductSuccessState) {
      return state.toMap();
    }
    return null; // Handle other cases if needed
  }
}
