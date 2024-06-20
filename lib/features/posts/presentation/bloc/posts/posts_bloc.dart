// ignore_for_file: public_member_api_docs, sort_constructors_first, type_literal_in_constant_pattern

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/core/error/failure.dart';
import 'package:posts/core/messages/failure_message.dart';

import 'package:posts/features/posts/domain/use_cases/get_all_posts.dart';

import '../../../domain/entities/posts.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetAllPostsUseCase getAllPosts;
  PostsBloc({
    required this.getAllPosts,
  }) : super(PostsInitial()) {
    on<PostsEvent>((event, emit) async {
      if (event is GetAllPostsEvent) {
        emit(LoadingPostsState());
        final failureOrPosts = await getAllPosts();
        emit(mapFailureOrPostsToState(failureOrPosts));
      } else if (event is RefreshPostsEvent) {
        emit(LoadingPostsState());
        final failureOrPosts = await getAllPosts();
        emit(mapFailureOrPostsToState(failureOrPosts));
      }
    });
  }
  PostsState mapFailureOrPostsToState(Either<Failure, List<Post>> either) {
    return either.fold(
        (failure) => ErrorPostsState(
              message: mapFailureTOMessage(failure),
            ),
        (posts) => LoadedPostsState(posts: posts));
  }

  String mapFailureTOMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case EmptyCacheFailure:
        return emptyCacheFailureMessage;
      case OfflineFailure:
        return offlineFailureMessage;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
