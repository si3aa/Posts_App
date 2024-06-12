import 'package:flutter/material.dart';
import 'package:posts/features/posts/domain/entities/posts.dart';

class PostsListWidget extends StatelessWidget {
  final List<Post> posts;
  const PostsListWidget({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text(
            posts[index].id.toString(),
            style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
          ),
          title: Text(
            posts[index].title,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold,),
          ),
          subtitle: Text(
            posts[index].body,
            style: const TextStyle(fontSize: 16,color: Colors.grey),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          onTap: () {},
        );
      },
      separatorBuilder: (context, index) => const Divider(thickness: 1),
    );
  }
}
