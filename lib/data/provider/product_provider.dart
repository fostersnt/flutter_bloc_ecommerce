import 'dart:convert';

import 'package:ecommerce/data/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductProvider {
  Future<List<ProductModel>> productsFetch() async {
    List<ProductModel> myPosts = [];
    try {
      var url = Uri.parse("https://fakestoreapi.com/products");
      // print("MY URL: ${url}");
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        print("JSON DATA COUNT === ${jsonData.length}");
        for (var i = 0; i < jsonData.length; i++) {
          // print("YOUR DATA IS === ${jsonData[i]['id']}");
          ProductModel post = ProductModel(
              id: jsonData[i]['id'],
              price: jsonData[i]['price'].toDouble(),
              title: jsonData[i]['title'],
              description: jsonData[i]['description'],
              category: jsonData[i]['category'],
              image: jsonData[i]['image'],
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
