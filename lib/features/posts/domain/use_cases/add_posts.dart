import 'package:dartz/dartz.dart';
import 'package:posts/features/posts/domain/entities/posts.dart';
import 'package:posts/features/posts/domain/repo/posts_repo.dart';

import '../../../../core/error/failure.dart';

class AddPostsUseCase{
  final PostsRepository repository;

 AddPostsUseCase(this.repository);
  Future<Either<Failure, Unit>> call(Post post)async{
    return await repository.addPosts(post);
  }
}