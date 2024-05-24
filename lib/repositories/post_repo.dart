import 'dart:convert';

import 'package:ecommerce/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostsRepo {
  static Future<List<PostModel>> fetchPosts() async {
    var url = Uri.parse('https://fakestoreapi.com/products');
    // https://jsonplaceholder.typicode.com/posts/

    var response = await http.get(url);

    List<PostModel> myPosts = [];

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print("JSON DATA COUNT === ${jsonData.length}");
      for (var i = 0; i < jsonData.length; i++) {
        // print("YOUR DATA IS === ${jsonData[i]['id']}");
        PostModel post = PostModel(
            id: jsonData[i]['id'],
            title: jsonData[i]['title'],
            price: jsonData[i]['price'].toDouble(),
            description: jsonData[i]['description'],
            image: jsonData[i]['image'],
            category: jsonData[i]['category']);
        myPosts.add(post);
      }
      return myPosts;
    } else {
      return [];
    }
  }
}
