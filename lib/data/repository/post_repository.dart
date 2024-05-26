import 'package:ecommerce/data/interface/i_repository.dart';
import 'package:ecommerce/data/model/post_model.dart';
import 'package:ecommerce/data/provider/post_provider.dart';

class PostRepository implements IRepository<PostModel> {
  final PostProvider postProvider;
  PostRepository({
    required this.postProvider,
  });

  @override
  Future<List<PostModel>> getAllData() {
    return postProvider.getPosts();
  }

  @override
  Future<List<PostModel>> deleteData() {
    // TODO: implement deleteData
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getSingleData() {
    // TODO: implement getSingleData
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> updateData() {
    // TODO: implement updateData
    throw UnimplementedError();
  }
}
