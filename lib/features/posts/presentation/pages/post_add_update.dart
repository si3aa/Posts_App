import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/core/utils/snackbar.dart';
import 'package:posts/core/widgets/loading_widget.dart';
import 'package:posts/features/posts/domain/entities/posts.dart';
import 'package:posts/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:posts/features/posts/presentation/pages/posts_page.dart';
import 'package:posts/features/posts/presentation/widgets/add_update_post/form_widget.dart';

class PostAddUpdatePage extends StatelessWidget {
  static String routeName = 'post';
  final Post? post;
  final bool isUpdatePost;
  const PostAddUpdatePage({super.key, this.post, required this.isUpdatePost});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: buildBody(context),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      title: Text(isUpdatePost ? 'Edit Post' : 'Add Post'),
    );
  }

  Widget buildBody(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocConsumer<AddDeleteUpdatePostBloc, AddDeleteUpdatePostState>(
            listener: (context, state) {
          if (state is MessageAddDeleteUpdatePostState) {
            SnackbarMessage()
                .showSuccessSnackBar(message: state.message, context: context);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const PostsPage()),
                (route) => false);
          } else if (state is ErrorAddDeleteUpdatePostState) {
            SnackbarMessage()
                .showErrorSnackBar(message: state.message, context: context);
          }
        }, builder: (context, state) {
          if (state is LoadingAddDeleteUpdatePostState) {
            return const LoadingWidget();
          }
          return FormWidget(
            isUpdatePost:isUpdatePost, post:isUpdatePost? post:null
          );
         
        }),
      ),
    );
  }
}
