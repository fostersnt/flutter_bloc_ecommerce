import 'package:ecommerce/features/posts/bloc/posts_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatelessWidget {
  final PostsBloc postsBloc = PostsBloc();

  @override
  Widget build(BuildContext context) {
    postsBloc.add(PostsInitialFetchEvent());
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BlocConsumer<PostsBloc, PostsState>(
            bloc: postsBloc,
            listener: (context, state) {},
            listenWhen: (previous, current) => current is PostsActionState,
            buildWhen: (previous, current) => current is! PostsActionState,
            builder: (context, state) {
              if (state.runtimeType == PostsFetchingSuccessfulState) {
                final successState = state as PostsFetchingSuccessfulState;
                return Container(
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: successState.posts.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              color: Colors.grey.shade200,
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
                                  Text(
                                    successState.posts[index].description
                                        .toString(),
                                    maxLines: 3,
                                    overflow: TextOverflow.fade,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "GHs ${successState.posts[index].price.toString()}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.red),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      successState.posts[index].image
                                          .toString(),
                                      height: 300,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.fitWidth,
                                      loadingBuilder:
                                          (context, child, progress) {
                                        if (progress == null) return child;
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: progress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? progress
                                                        .cumulativeBytesLoaded /
                                                    progress.expectedTotalBytes!
                                                : null,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      );
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
