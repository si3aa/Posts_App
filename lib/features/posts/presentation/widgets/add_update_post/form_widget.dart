import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/features/posts/domain/entities/posts.dart';
import 'package:posts/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:posts/features/posts/presentation/widgets/add_update_post/form_submit_btn.dart';
import 'package:posts/features/posts/presentation/widgets/add_update_post/text_form.dart';

class FormWidget extends StatefulWidget {
  final Post? post;
  final bool isUpdatePost;
  const FormWidget({super.key, this.post, required this.isUpdatePost});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  @override
  void initState() {
    if (widget.isUpdatePost) {
      titleController.text = widget.post!.title;
      bodyController.text = widget.post!.body;
    }
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormFieldWidget(name:"Title",controller:titleController,multline:false),
          TextFormFieldWidget(name:"Body",controller:bodyController,multline:true),
          FormSubmitBtn(isUpdatePost:widget.isUpdatePost,onPressed:validateFormThenUpdateOrAddPost)
          
        ],
      ),
    );
  }
   void validateFormThenUpdateOrAddPost() {
    final isValid =formKey.currentState!.validate();
    if(isValid) {
      final post = Post(
        id: widget.isUpdatePost?widget.post!.id:null,
        title: titleController.text,
        body: bodyController.text, 
      );
      if (widget.isUpdatePost) {
        BlocProvider.of<AddDeleteUpdatePostBloc>(context).add(UpdatePostEvent(post: post));
      }else{
        BlocProvider.of<AddDeleteUpdatePostBloc>(context).add(UpdatePostEvent(post: post));
      }
    }
  }

}
