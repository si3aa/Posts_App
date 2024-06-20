import 'package:dartz/dartz.dart';
import '../entities/posts.dart';
import '../repo/posts_repo.dart';

import '../../../../core/error/failure.dart';

class UpdatePostsUseCase{
  final PostsRepository repository;

  UpdatePostsUseCase(this.repository);
  Future<Either<Failure, Unit>> call(Post post)async{
    return await repository.updatePosts(post);
  }
}