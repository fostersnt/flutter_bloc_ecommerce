// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:ecommerce/data/interface/i_repository.dart';
import 'package:ecommerce/data/model/product_model.dart';
import 'package:ecommerce/data/provider/product_provider.dart';

class ProductRepository implements IRepository {
  final ProductProvider productProvider;
  ProductRepository({
    required this.productProvider,
  });

  @override
  Future<List> deleteData() {
    // TODO: implement deleteData
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> getAllData() {
    // TODO: implement getAllData
    return productProvider.productsFetch();
  }

  @override
  Future<List> getSingleData() {
    // TODO: implement getSingleData
    throw UnimplementedError();
  }

  @override
  Future<List> updateData() {
    // TODO: implement updateData
    throw UnimplementedError();
  }
}
