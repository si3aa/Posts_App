import 'package:flutter/material.dart';
import 'package:posts/core/theme.dart';

class FormSubmitBtn extends StatelessWidget {
  final void Function() onPressed;
  final bool isUpdatePost;
  const FormSubmitBtn(
      {super.key, required this.onPressed, required this.isUpdatePost});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(primaryColor),
      ),
      onPressed: onPressed,
      icon: isUpdatePost
          ? const Icon(
              Icons.edit,
              color: Colors.white,
            )
          : const Icon(Icons.add, color: Colors.white),
      label: Text(
        isUpdatePost ? "Update" : "Add",
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
