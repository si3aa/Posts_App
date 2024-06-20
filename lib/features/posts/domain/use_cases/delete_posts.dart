import 'package:dartz/dartz.dart';
import '../repo/posts_repo.dart';

import '../../../../core/error/failure.dart';

class DeletePostsUseCase{
  final PostsRepository repository;

  DeletePostsUseCase(this.repository);
  Future<Either<Failure, Unit>> call(int postId)async{
    return await repository.deletePosts(postId);
  }
}