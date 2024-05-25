import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/models/post_model.dart';
import 'package:ecommerce/repositories/post_repo.dart';
import 'package:meta/meta.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
  }

  Future<void> postsInitialFetchEvent(
      PostsInitialFetchEvent event, Emitter<PostsState> emit) async {
    emit(PostsFetchingLoadState());
    try {
      var postsData = await PostsRepo.fetchPosts();
      emit(PostsFetchingSuccessfulState(posts: postsData));
      print("DATA FETCHED");
    } catch (e) {
      print("MY ERROR MESSAGE: ${e.toString()}");
    }
  }
}
