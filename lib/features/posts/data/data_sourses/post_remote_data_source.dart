import 'package:dartz/dartz.dart';
import 'package:posts/features/posts/data/models/post_model.dart';

abstract class PostRemoteDataSource{
  Future<List<PostModel>> getAllPosts();
  Future<Unit>deletePosts(int postId);
  Future<Unit>updatePosts(PostModel postModel);
  Future<Unit>addPosts(PostModel postModel);
}
class PostRemoteDataSourceImpl implements PostRemoteDataSource{
  @override
  Future<Unit> addPosts(PostModel postModel) {
    // TODO: implement addPosts
    throw UnimplementedError();
  }

  @override
  Future<Unit> deletePosts(int postId) {
    // TODO: implement deletePosts
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getAllPosts() {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }

  @override
  Future<Unit> updatePosts(PostModel postModel) {
    // TODO: implement updatePosts
    throw UnimplementedError();
  }

}