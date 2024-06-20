import 'package:dartz/dartz.dart';
import '../entities/posts.dart';
import '../repo/posts_repo.dart';

import '../../../../core/error/failure.dart';

class AddPostsUseCase{
  final PostsRepository repository;

 AddPostsUseCase(this.repository);
  Future<Either<Failure, Unit>> call(Post post)async{
    return await repository.addPosts(post);
  }
}