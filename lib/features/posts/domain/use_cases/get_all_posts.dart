import 'package:dartz/dartz.dart';
import 'package:posts/features/posts/domain/entities/posts.dart';
import 'package:posts/features/posts/domain/repo/posts_repo.dart';

import '../../../../core/error/failure.dart';

class GetAllPostsUseCase {
  final PostsRepository repository;

  GetAllPostsUseCase(this.repository);

   Future<Either<Failure, List<Post>>> call()async{
    return await repository.getAllPosts();
   }
}
