part of 'posts_bloc.dart';

@immutable
abstract class PostsEvent extends Equatable {}

class LoadPostsEvent extends PostsEvent {
  @override
  List<Object?> get props => [];
}
