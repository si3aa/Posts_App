import 'package:dartz/dartz.dart';
import 'package:posts/core/error/exception.dart';
import 'package:posts/core/error/failure.dart';
import 'package:posts/core/network/network_info.dart';
import 'package:posts/features/posts/data/data_sourses/post_local_data_source.dart';
import 'package:posts/features/posts/data/data_sourses/post_remote_data_source.dart';
import 'package:posts/features/posts/data/models/post_model.dart';
import 'package:posts/features/posts/domain/entities/posts.dart';
import 'package:posts/features/posts/domain/repo/posts_repo.dart';
typedef DeleteOrUpdateOrAddPost = Future<Unit> Function();

class PostsRepositoryIpm implements PostsRepository {
  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  PostsRepositoryIpm(
      {required this.localDataSource,
      required this.remoteDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getAllPosts();
        localDataSource.cachePosts(remotePosts);
        return Right(remotePosts);
      } on ServerFailureException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPosts = await localDataSource.getCachedPosts();
        return Right(localPosts);
      } on EmptyCacheFailureException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addPosts(Post post) async {
    final PostModel postModel =
        PostModel( title: post.title, body: post.body);
    return await getMessages((){
     return remoteDataSource.addPosts(postModel);
   });
  }

  @override
  Future<Either<Failure, Unit>> deletePosts(int postId) async {
    return await getMessages((){
     return remoteDataSource.deletePosts(postId);
   });
  }

  @override
  Future<Either<Failure, Unit>> updatePosts(Post post) async {
    final PostModel postModel =
        PostModel(id: post.id, title: post.title, body: post.body);
   return await getMessages((){
     return remoteDataSource.updatePosts(postModel);
   });
   
  }

  Future<Either<Failure, Unit>> getMessages(
      DeleteOrUpdateOrAddPost deleteOrUpdateOrAddPost) async {
    if (await networkInfo.isConnected) {
      try {
       await deleteOrUpdateOrAddPost();
        return const Right(unit);
      } on ServerFailureException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
