import 'dart:convert';

import 'package:ecommerce/api/api_endpoints.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRepo {
  static Future<List<ProductModel>> productsFetch() async {
    List<ProductModel> myPosts = [];
    try {
      FakeStoreAPI fakeStore = FakeStoreAPI();
      var url = Uri.parse(
          "${fakeStore.fakeStoreBaseUrl} ${fakeStore.productsEndpoint}");

      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        print("JSON DATA COUNT === ${jsonData.length}");
        for (var i = 0; i < jsonData.length; i++) {
          // print("YOUR DATA IS === ${jsonData[i]['id']}");
          ProductModel post = ProductModel(
              id: jsonData[i]['id'],
              price: jsonData[i]['price'],
              title: jsonData[i]['title'],
              description: jsonData[i]['description'],
              category: jsonData[i]['category'],
              rating: jsonData[i]['rating']);
          myPosts.add(post);
        }
      }
      return myPosts;
    } catch (e) {
      print(e.toString());
      return myPosts;
    }
  }
}
