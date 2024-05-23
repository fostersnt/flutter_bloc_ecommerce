import 'package:ecommerce/features/posts/bloc/bloc/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PostsPage extends StatelessWidget {
  final PostsBloc postsBloc = PostsBloc();

  @override
  Widget build(BuildContext context) {
    postsBloc.add(PostsInitialFetchEvent());
    // TODO: implement build
    // throw UnimplementedError();
    return const Center(
      child: Text("FOSTER'S STORE"),
    );
  }
}
