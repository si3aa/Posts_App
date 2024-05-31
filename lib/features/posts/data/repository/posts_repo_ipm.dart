import 'package:dartz/dartz.dart';
import 'package:posts/core/error/failure.dart';
import 'package:posts/features/posts/data/data_sourses/post_local_data_source.dart';
import 'package:posts/features/posts/data/data_sourses/post_remote_data_source.dart';
import 'package:posts/features/posts/domain/entities/posts.dart';
import 'package:posts/features/posts/domain/repo/posts_repo.dart';

class PostsRepositoryIpm implements PostsRepository {
  final  PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;
  PostsRepositoryIpm({required this.localDataSource, required this.remoteDataSource});
  @override
  Future<Either<Failure, List<Post>>> getAllPosts()async {
    await remoteDataSource.getAllPosts();
    await localDataSource.getCachedPosts();
     throw UnimplementedError();
   
  }

  @override
  Future<Either<Failure, Unit>> addPosts(Post post) {
    // TODO: implement addPosts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deletePosts(int id) {
    // TODO: implement deletePosts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updatePosts(Post post) {
    // TODO: implement updatePosts
    throw UnimplementedError();
  }
}
