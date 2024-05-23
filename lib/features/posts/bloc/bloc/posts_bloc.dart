import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/models/posts_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
  }

  FutureOr<void> postsInitialFetchEvent(
      PostsInitialFetchEvent event, Emitter<PostsState> emit) async {
    try {
      var url = Uri.parse('https://fakestoreapi.com/products');
      // https://jsonplaceholder.typicode.com/posts/

      var response = await http.get(url);
      List<PostsModel> myPosts = [];
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        print("JSON DATA COUNT === ${jsonData.length}");
        for (var i = 0; i < jsonData.length; i++) {
          // print("YOUR DATA IS === ${jsonData[i]['id']}");
          PostsModel post = PostsModel(
              id: jsonData[i]['id'],
              title: jsonData[i]['title'],
              price: jsonData[i]['price'].toDouble(),
              description: jsonData[i]['description'],
              image: jsonData[i]['image'],
              category: jsonData[i]['category']);
          myPosts.add(post);
        }
        emit(PostsFetchingSuccessfulState(posts: myPosts));
        print("PRICE: GHs ${myPosts[4].price}");
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print(e);
    }
  }
}
