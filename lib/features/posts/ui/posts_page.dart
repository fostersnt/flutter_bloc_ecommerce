import 'package:ecommerce/features/posts/bloc/bloc/posts_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PostsPage extends StatelessWidget {
  final PostsBloc postsBloc = PostsBloc();

  @override
  Widget build(BuildContext context) {
    postsBloc.add(PostsInitialFetchEvent());
    // TODO: implement build
    // throw UnimplementedError();
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.all(10),
            // margin: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .25,
            color: Colors.red,
            child: const Center(
              child: Text("FOSTER'S STORE"),
            ),
          ),
        ),
      ),
    );
  }
}
