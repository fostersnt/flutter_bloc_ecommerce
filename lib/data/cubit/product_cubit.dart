import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductState(productName: ''));

  void setOriginalProductName() => emit(ProductState(productName: 'Cowbell'));
  void setFakeProductName() => emit(ProductState(productName: 'Fanta'));
}
