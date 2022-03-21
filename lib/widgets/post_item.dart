import 'package:api_intergration/utils/color.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  String title;
  String? subtitle;
  PostItem({
    Key? key,
    required this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: kPrimaryAccentColor.withOpacity(.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 3),
          )
        ],
      ),
      margin: EdgeInsets.only(right:4.0,left:4.0,top: 6.0, bottom: 12.0),
      child: ListTile(
        leading: Icon(
          Icons.account_circle_outlined,
          color: kPrimaryAccentColor,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            wordSpacing: 3,
          ),
        ),
        subtitle: subtitle == null
            ? null
            : Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(subtitle!),
              ),
      ),
    );
  }
}
