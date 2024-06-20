import 'package:dartz/dartz.dart';
import '../entities/posts.dart';

import '../../../../core/error/failure.dart';

abstract class PostsRepository {
  Future<Either<Failure, List<Post>>> getAllPosts();
  Future<Either<Failure, Unit>> deletePosts(int id);
  Future<Either<Failure, Unit>> updatePosts(Post post);
  Future<Either<Failure, Unit>> addPosts(Post post);
}

//unit returns no thing 

//postsRepository is an abstract class because it connects domainLayer and dataLayer

/*Either return RHS if there an error it willl return LHS */

