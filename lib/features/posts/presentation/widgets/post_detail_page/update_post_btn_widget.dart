import 'package:flutter/material.dart';
import '../../../../../core/theme.dart';
import '../../../domain/entities/posts.dart';
import '../../pages/post_add_update.dart';

class UpdatePostBtnWidget extends StatelessWidget {
  final Post post;
  const UpdatePostBtnWidget({super.key,required this.post});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
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
              );
  }
}