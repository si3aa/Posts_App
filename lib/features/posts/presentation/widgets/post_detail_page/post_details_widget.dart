import 'package:flutter/material.dart';
import 'package:posts/core/theme.dart';
import 'package:posts/features/posts/domain/entities/posts.dart';
import 'package:posts/features/posts/presentation/pages/post_add_update.dart';
import 'package:posts/features/posts/presentation/widgets/post_detail_page/delete_post_btn_widget.dart';

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
              UpdatePostBtnWidget(post:post),
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
              DeletePostBtnWidget(postId: post.id!),
            ],
          )
        ],
      ),
    );
  }
}
