import 'package:flutter/material.dart';

showError(BuildContext context, String content) {
  showDialog(
    context: context,
    builder: (context) =>  AlertDialog(
      title: const Text('Error Input!'),
      content: Text(content),
    ),
  );
}
