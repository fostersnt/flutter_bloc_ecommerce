// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'posts_bloc.dart';

@immutable
sealed class PostsState extends Equatable {}

final class PostsInitial extends PostsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

abstract class PostsActionState extends PostsState {}

class PostLoadingState extends PostsState {
  @override
  List<Object?> get props => [];
}

class PostErrorState extends PostsState {
  final String errorMessage;
  PostErrorState({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [];
}

class PostSuccessState extends PostsState {
  final List<PostModel> posts;

  PostSuccessState({required this.posts});

  @override
  List<Object?> get props => posts;
}
