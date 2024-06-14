import 'package:flutter/material.dart';
import 'package:posts/features/posts/domain/entities/posts.dart';
import 'package:posts/features/posts/presentation/widgets/post_detail_page/post_details_widget.dart';

class PostDetailPage extends StatelessWidget {
  final Post post;
  const PostDetailPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: buildBody());
  }

  Widget buildBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: PostDetailWidget(post: post),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text('Post Detail',style: TextStyle(color: Colors.white),),
      iconTheme:const IconThemeData(color: Colors.white),
    );
  }
}
