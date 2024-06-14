import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/core/theme.dart';
import 'package:posts/core/utils/snackbar.dart';
import 'package:posts/core/widgets/loading_widget.dart';
import 'package:posts/features/posts/domain/entities/posts.dart';
import 'package:posts/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:posts/features/posts/presentation/pages/post_add_update.dart';
import 'package:posts/features/posts/presentation/pages/posts_page.dart';

class PostDetailWidget extends StatelessWidget {
  final Post post;
  const PostDetailWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            post.title,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const Divider(height: 50),
          Text(
            post.body,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const Divider(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(primaryColor),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PostAddUpdatePage(
                        isUpdatePost: true,
                        post: post,
                      ),
                    ),
                  );
                },
                label:
                    const Text("Edit", style: TextStyle(color: Colors.white)),
                icon: const Icon(Icons.edit, color: Colors.white),
              ),
              ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.red),
                ),
                onPressed: ()=>deleteDialog(context),
                label:
                    const Text("Delete", style: TextStyle(color: Colors.white)),
                icon: const Icon(Icons.delete_outlined, color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
  void deleteDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
      return  BlocConsumer<AddDeleteUpdatePostBloc, AddDeleteUpdatePostState>(
          listener: (context, state) {
            if (state is MessageAddDeleteUpdatePostState) {
              SnackbarMessage().showSuccessSnackBar(
                  message: state.message, context: context);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_)=>const PostsPage()), (route)=>false);
            }else if (state is ErrorAddDeleteUpdatePostState){
              Navigator.of(context).pop();
              SnackbarMessage().showErrorSnackBar(
                  message: state.message, context: context);
            }
          },
          builder: (context,state){
            if(state is LoadingAddDeleteUpdatePostState){
              return const AlertDialog(
                title: LoadingWidget(),
              );
            }
            return DeleteDialogWidget(postId:post.id);
          },
        );
      });
}
}


