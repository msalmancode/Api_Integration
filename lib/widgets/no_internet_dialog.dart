import 'package:flutter/material.dart';

class NoInternetDialog extends StatelessWidget {
  const NoInternetDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          Icon(
            Icons.wifi_off,
            size: 30,
            color: Colors.grey.withOpacity(.8),
          ),
          SizedBox(
            height: 20,
          ),
          const Text(
            'No Internet Connection',
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
