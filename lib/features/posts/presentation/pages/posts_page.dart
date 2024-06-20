import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../bloc/posts/posts_bloc.dart';
import 'post_add_update.dart';
import '../widgets/posts_page/message_display.dart';
import '../widgets/posts_page/posts_list_widget.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: buildBody(),
      floatingActionButton: buildFloatingBtn(context),
    );
  }
}

AppBar buildAppbar() => AppBar(
      title: const Text(
        'Posts',
        style: TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );

Widget buildBody() {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: BlocBuilder<PostsBloc, PostsState>(builder: (context, state) {
      if (state is LoadingPostsState) {
        return const LoadingWidget();
      } else if (state is LoadedPostsState) {
        return RefreshIndicator(
            onRefresh: () => onRefresh(context),
            child: PostsListWidget(posts: state.posts));
      } else if (state is ErrorPostsState) {
        return MessageDisplyWidget(message: state.message);
      }
      return const LoadingWidget();
    }),
  );
}

buildFloatingBtn(BuildContext context) {
  return FloatingActionButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const PostAddUpdatePage(isUpdatePost: false),
        ),
      );
    },
    child: const Icon(Icons.add),
  );
}

Future<void> onRefresh(BuildContext context) async {
  BlocProvider.of<PostsBloc>(context).add(RefreshPostsEvent());
}
