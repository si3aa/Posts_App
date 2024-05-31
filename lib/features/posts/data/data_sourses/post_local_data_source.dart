import 'package:dartz/dartz.dart';
import 'package:posts/features/posts/data/models/post_model.dart';

abstract class PostLocalDataSource{
  Future<List<PostModel>> getCachedPosts();
  Future<Unit> cachePosts(List<PostModel> posts);
}
class PostLocalDataSourceImpl implements PostLocalDataSource{
  @override
  Future<Unit> cachePosts(List<PostModel> posts) {
    // TODO: implement cachePosts
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getCachedPosts() {
    // TODO: implement getCachedPosts
    throw UnimplementedError();
  }

}