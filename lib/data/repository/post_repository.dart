// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce/data/model/post_model.dart';
import 'package:ecommerce/data/provider/post_provider.dart';

abstract class IPostRepository {
  Future<List<PostModel>> getPosts();
}

class PostRepository implements IPostRepository {
  final PostProvider postProvider;
  PostRepository({
    required this.postProvider,
  });

  @override
  Future<List<PostModel>> getPosts() {
    return postProvider.getPosts();
  }
}
