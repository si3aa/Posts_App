import 'package:flutter/material.dart';

class SnackbarMessage{
  void showSuccessSnackBar({required String message,required BuildContext context}){
    ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  message,
                   textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    backgroundColor: Colors.green,
                  ),
                ),
              ),
            );
  }

   void showErrorSnackBar({required String message,required BuildContext context}){
    ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
            );
  }
}