import 'package:api_intergration/route/app_routes.dart';
import 'package:api_intergration/utils/color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(title: Text('Home')),
      body: Container(
        margin: EdgeInsets.all(24.0),
        child: ListView(
          children: [
            itemData(
                onTap: () => onClickRoute(routeName: Routes.getApiScreen),
                title: 'Get'),
            SizedBox(height: 16.0),
            itemData(
                onTap: () => onClickRoute(routeName: Routes.postApiScreen),
                title: 'Post'),
            SizedBox(height: 16.0),
            itemData(
              onTap: () => onClickRoute(routeName: Routes.patchApiScreen),
              title: 'Patch',
            ),
            SizedBox(height: 16.0),
            itemData(
                onTap: () => onClickRoute(routeName: Routes.formDataApiScreen),
                title: 'Form Data'),
            SizedBox(height: 16.0),
            itemData(
                onTap: () =>
                    onClickRoute(routeName: Routes.fileUploadApiScreen),
                title: 'Base64'),
          ],
        ),
      ),
    );
  }

  Widget itemData({required String title, required Function onTap}) {
    return Container(
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: () => onTap(),
        leading: Icon(
          Icons.api,
          color: kPrimaryAccentColor,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            wordSpacing: 4,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: kPrimaryAccentColor,
        ),
      ),
    );
  }

  /// CLick Listener
  void onClickRoute({required String routeName}) {
    Navigator.pushNamed(context, routeName);
  }
}
