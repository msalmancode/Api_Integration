import 'package:api_intergration/utils/color.dart';
import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          Icon(
            Icons.verified,
            size: 40,
            color: Colors.green.withOpacity(.8),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'File Successfully converted into base 64 format',
            textAlign: TextAlign.center,
            style: TextStyle(color: kPrimaryAccentColor.withOpacity(0.5)),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
