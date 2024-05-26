part of 'posts_bloc.dart';

@immutable
sealed class PostsState {}

final class PostsInitial extends PostsState {}

abstract class PostsActionState extends PostsState {}

class PostsFetchingLoadState extends PostsState {}

class PostsFetchingErrorState extends PostsState {}

class PostsFetchingSuccessfulState extends PostsState {
  final List<PostModel> posts;

  PostsFetchingSuccessfulState({required this.posts});
}
