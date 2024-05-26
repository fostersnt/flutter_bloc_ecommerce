import 'package:ecommerce/data/model/post_model.dart';

abstract class IPostRepository {
  Future<List<PostModel>> getPosts();
}
