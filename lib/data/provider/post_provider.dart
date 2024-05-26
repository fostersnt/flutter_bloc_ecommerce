import 'dart:convert';

import 'package:ecommerce/data/model/post_model.dart';
import 'package:http/http.dart' as http;

class PostProvider {
  Future<List<PostModel>> getPosts() async {
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
      var response = await http.get(url);
      print("API API API");

      List<PostModel> myPosts = [];

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        print("JSON DATA COUNT === ${jsonData.length}");
        for (var i = 0; i < jsonData.length; i++) {
          // print("YOUR DATA IS === ${jsonData[i]['id']}");
          PostModel post = PostModel(
            id: jsonData[i]['id'],
            userId: jsonData[i]['userId'],
            title: jsonData[i]['title'],
            body: jsonData[i]['body'],
          );
          myPosts.add(post);
        }
      }
      return myPosts;
    } catch (e) {
      print(e.toString());
      return Future.error(e.toString());
    }
  }
}
