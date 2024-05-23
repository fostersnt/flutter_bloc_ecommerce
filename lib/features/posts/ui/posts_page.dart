import 'package:ecommerce/features/posts/bloc/bloc/posts_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          child: BlocConsumer<PostsBloc, PostsState>(
            bloc: postsBloc,
            listener: (context, state) {
              // print(state);
            },
            listenWhen: (previous, current) => current is PostsActionState,
            buildWhen: (previous, current) => current is! PostsActionState,
            builder: (context, state) {
              if (state.runtimeType == PostsFetchingSuccessfulState) {
                final successState = state as PostsFetchingSuccessfulState;
                return Container(
                  // padding: const EdgeInsets.all(10),
                  // margin: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height * .25,
                  // color: Colors.grey.shade200,
                  child: ListView.builder(
                    itemCount: successState.posts.length,
                    itemBuilder: (context, index) {
                      return Container(
                          padding: const EdgeInsets.all(10),
                          color: Colors.grey.shade200,
                          margin: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                successState.posts[index].title.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(successState.posts[index].description
                                  .toString()),
                              const SizedBox(
                                height: 10,
                              ),
                              Image.network(
                                successState.posts[index].image.toString(),
                                // height: 300,
                              ),
                            ],
                          ));
                    },
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
