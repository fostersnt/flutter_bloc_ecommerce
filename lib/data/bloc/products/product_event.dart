import 'package:equatable/equatable.dart';

sealed class ProductEvent extends Equatable {}

class AllProductsFetchEvent extends ProductEvent {
  @override
  List<Object?> get props => [];
}

class SingleProductFetchEvent extends ProductEvent {
  @override
  List<Object?> get props => [];
}
