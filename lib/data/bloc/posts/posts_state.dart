// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'posts_bloc.dart';

@immutable
sealed class PostsState {}

final class PostsInitial extends PostsState {}

abstract class PostsActionState extends PostsState {}

class PostLoadingState extends PostsState {}

class PostErrorState extends PostsState {
  final String errorMessage;
  PostErrorState({
    required this.errorMessage,
  });
}

class PostSuccessState extends PostsState {
  final List<PostModel> posts;

  PostSuccessState({required this.posts});
}
