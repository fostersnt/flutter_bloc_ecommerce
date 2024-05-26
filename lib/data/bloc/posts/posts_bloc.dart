
import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/model/post_model.dart';
import 'package:ecommerce/data/repository/post_repository.dart';
import 'package:meta/meta.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostRepository _postRepository;
  PostsBloc(this._postRepository) : super(PostsInitial()) {
    //Fetching posts data using the LoadPostsEvent
    on<LoadPostsEvent>((event, emit) async {
      emit(PostLoadingState());

      try {
        final myPosts = await _postRepository.getPosts();
        emit(PostSuccessState(posts: myPosts));
      } catch (e) {
        print("ERROR HAS OCCURRED: ${e.toString()}");
        emit(PostErrorState(errorMessage: e.toString()));
      }
    });
  }
}
