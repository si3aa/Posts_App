import 'package:dartz/dartz.dart';
import 'package:posts/features/posts/domain/entities/posts.dart';

import '../../../../core/error/failure.dart';

abstract class PostsRepository {
  Future<Either<Failure, List<Post>>> getAllPosts();
  Future<Either<Failure, Unit>> deletePosts(int id);
  Future<Either<Failure, Unit>> updatePosts(Post post);
  Future<Either<Failure, Unit>> addPosts(Post post);
}
