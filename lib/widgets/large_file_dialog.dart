import 'package:flutter/material.dart';

class LargeFileDialog extends StatelessWidget {
  const LargeFileDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          Icon(
            Icons.error_outline,
            size: 30,
            color: Colors.yellow,
          ),
          SizedBox(
            height: 20,
          ),
          const Text(
            'File size is larger than 4 Kb',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Try Again'),
        ),
      ],
    );
  }
}
