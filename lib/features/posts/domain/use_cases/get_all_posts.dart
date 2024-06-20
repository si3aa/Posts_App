import 'package:dartz/dartz.dart';
import '../entities/posts.dart';
import '../repo/posts_repo.dart';

import '../../../../core/error/failure.dart';

class GetAllPostsUseCase {
  final PostsRepository repository;

  GetAllPostsUseCase(this.repository);

   Future<Either<Failure, List<Post>>> call()async{
    return await repository.getAllPosts();
   }
}
