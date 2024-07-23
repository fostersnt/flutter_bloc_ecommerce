import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductState(productName: ''));

  void setOriginalProductName() => emit(ProductState(productName: 'Cowbell'));
  void setFakeProductName() async {
    try {
      String url = 'https://fakestoreapi.com/products';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        print('PRODUCT DATA === ${response.body}');
      } else {
        print('PRODUCT RESPONSE === ${response}');
      }
      emit(ProductState(productName: 'Fanta'));
    } catch (e) {
      print('PRODUCT FETCH ERROR === ${e.toString()}');
    }
  }
}
