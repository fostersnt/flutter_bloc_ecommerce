part of 'posts_bloc.dart';

@immutable
sealed class PostsState {}

final class PostsInitial extends PostsState {}

class PostsFetchingSuccessful extends PostsState {
  final List<PostsModel> posts;

  PostsFetchingSuccessful({required this.posts});
}
