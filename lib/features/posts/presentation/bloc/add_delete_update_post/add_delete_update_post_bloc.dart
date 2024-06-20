// ignore_for_file: type_literal_in_constant_pattern

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/messages/failure_message.dart';
import '../../../../../core/messages/messages.dart';
import '../../../domain/entities/posts.dart';
import '../../../domain/use_cases/add_posts.dart';
import '../../../domain/use_cases/delete_posts.dart';
import '../../../domain/use_cases/updata_posts.dart';

import '../../../../../core/error/failure.dart';

part 'add_delete_update_post_event.dart';
part 'add_delete_update_post_state.dart';

class AddDeleteUpdatePostBloc
    extends Bloc<AddDeleteUpdatePostEvent, AddDeleteUpdatePostState> {
  final AddPostsUseCase addPost;
  final DeletePostsUseCase deletePost;
  final UpdatePostsUseCase updatePost;
  AddDeleteUpdatePostBloc(
      {required this.addPost,
      required this.deletePost,
      required this.updatePost})
      : super(AddDeleteUpdatePostInitial()) {
    on<AddDeleteUpdatePostEvent>((event, emit) async {
      if (event is AddPostEvent) {
        emit(LoadingAddDeleteUpdatePostState());
        final failureOrDoneMessage = await addPost(event.post);
        emit(LoadingAddDeleteUpdatePostState());
        emit(eitherDoneMessaageOrErrorState(
            failureOrDoneMessage, addSuccessMessage));
      } else if (event is UpdatePostEvent) {
        emit(LoadingAddDeleteUpdatePostState());
        final failureOrDoneMessage = await updatePost(event.post);
        emit(eitherDoneMessaageOrErrorState(
            failureOrDoneMessage, updateSuccessMessage));
      } else if (event is DeletePostEvent) {
        emit(LoadingAddDeleteUpdatePostState());
        final failureOrDoneMessage = await deletePost(event.postId);
        emit(eitherDoneMessaageOrErrorState(
            failureOrDoneMessage, deleteSuccessMessage));
      }
    });
  }
  AddDeleteUpdatePostState eitherDoneMessaageOrErrorState(
      Either<Failure, Unit> either, String message) {
    return either.fold(
        (failure) => ErrorAddDeleteUpdatePostState(
              message: mapFailureTOMessage(failure),
            ),
        (_) => MessageAddDeleteUpdatePostState(message: message));
  }

  String mapFailureTOMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure :
        return serverFailureMessage;
      case OfflineFailure :
        return offlineFailureMessage;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
