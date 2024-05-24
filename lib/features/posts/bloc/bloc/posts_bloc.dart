import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/models/posts_model.dart';
import 'package:ecommerce/repositories/posts_repo.dart';
import 'package:meta/meta.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
  }

  final PostsRepo _postsRepo = PostsRepo();

  FutureOr<void> postsInitialFetchEvent(
      PostsInitialFetchEvent event, Emitter<PostsState> emit) async {
    try {
      emit(PostsFetchingLoadState());
      var data = await _postsRepo.getPosts();
      emit(PostsFetchingSuccessfulState(posts: data));
      print("PRICE: GHs ${data[4].price}");
    } catch (e) {
      emit(PostsFetchingErrorState());
      print(e);
    }
  }
}
