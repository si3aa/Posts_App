import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller ;
  final bool multline ;
  final String name ;
  const TextFormFieldWidget({super.key, required this.controller, required this.multline, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding:const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: TextFormField(
              minLines: multline?6:1,
              maxLines: multline?6:1,
              controller: controller,
              validator: (val)=> val!.isEmpty?"$name must not be empty":null,
              decoration: InputDecoration(hintText: "$name "),
            ),
          );
  }
}